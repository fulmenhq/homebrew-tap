# Release Process for FulmenHQ Homebrew Tap

This document outlines the process for releasing signed binaries and updating Homebrew formulas for FulmenHQ applications.

## Overview

Our release process uses pre-built, signed binaries distributed via GitHub Releases. This approach:
- Preserves code signatures for security
- Speeds up installation (no compilation required)
- Supports multiple platforms and architectures
- Provides cryptographic verification via GPG signatures

## Prerequisites

1. **GPG Key**: Configured for signing releases
2. **GitHub CLI**: Installed and authenticated (`gh`)
3. **Build Tools**: goreleaser or similar (depending on the project)
4. **Permissions**: Write access to both the app repo and homebrew-tap repo

## Quick Start (Automated)

We provide automation scripts to simplify formula updates. After publishing a GitHub release:

```bash
# Update formula from GitHub release
make update-goneat VERSION=0.3.4

# Or update any app
make update APP=myapp VERSION=1.0.0

# Update from local files (if release not yet published)
make update-goneat VERSION=0.3.4 LOCAL=1

# Full workflow: update, audit, test, commit, and push
make release APP=goneat VERSION=0.3.4
```

### Available Make Targets

- `make update-goneat VERSION=x.x.x` - Update goneat from GitHub
- `make update APP=name VERSION=x.x.x` - Update any formula from GitHub
- `make style` - Check and fix code style issues (formulas and shell scripts)
- `make audit APP=name` - Run brew audit on a formula
- `make test APP=name` - Test install a formula locally
- `make clean APP=name` - Uninstall a formula
- `make release APP=name VERSION=x.x.x` - Full release workflow (update → style → audit → test → commit → push)

### How the Automation Works

The `scripts/update-formula.sh` script:
1. Fetches SHA256SUMS from GitHub release (or local files with `--local`)
2. Extracts checksums for all platform/architecture combinations
3. Updates the formula file with new version and URLs
4. Replaces SHA256 hashes for each platform

This eliminates manual copy-paste errors and makes releases fast and reliable.

## Manual Release Workflow

For reference or troubleshooting, here's the manual process:

### Step 1: Build and Sign Release Artifacts

For a Go project like `goneat`, the release artifacts should include:

**Supported Platforms:**
- `darwin_amd64` (macOS Intel)
- `darwin_arm64` (macOS Apple Silicon)
- `linux_amd64` (Linux x86_64)
- `linux_arm64` (Linux ARM64)
- `windows_amd64` (Windows x86_64)

**Required Files per Release:**
```
goneat_v{VERSION}_darwin_amd64.tar.gz
goneat_v{VERSION}_darwin_amd64.tar.gz.asc
goneat_v{VERSION}_darwin_arm64.tar.gz
goneat_v{VERSION}_darwin_arm64.tar.gz.asc
goneat_v{VERSION}_linux_amd64.tar.gz
goneat_v{VERSION}_linux_amd64.tar.gz.asc
goneat_v{VERSION}_linux_arm64.tar.gz
goneat_v{VERSION}_linux_arm64.tar.gz.asc
goneat_v{VERSION}_windows_amd64.zip
goneat_v{VERSION}_windows_amd64.zip.asc
SHA256SUMS
SHA256SUMS.asc
```

### Step 2: Generate Checksums

Create a `SHA256SUMS` file containing checksums for all archives:

```bash
sha256sum *.tar.gz *.zip > SHA256SUMS
gpg --detach-sign --armor SHA256SUMS
```

### Step 3: Upload to GitHub Releases

Upload all artifacts to the GitHub release:

```bash
gh release create v{VERSION} \
  --repo fulmenhq/{APP_NAME} \
  --title "v{VERSION}" \
  --notes "Release notes here" \
  *.tar.gz *.tar.gz.asc \
  *.zip *.zip.asc \
  SHA256SUMS SHA256SUMS.asc
```

Or upload to an existing release:

```bash
gh release upload v{VERSION} \
  --repo fulmenhq/{APP_NAME} \
  *.tar.gz *.tar.gz.asc \
  *.zip *.zip.asc \
  SHA256SUMS SHA256SUMS.asc
```

### Step 4: Update Homebrew Formula

Navigate to the homebrew-tap repository and create/update the formula in `Formula/{app_name}.rb`.

**Formula Structure for Binary Releases:**

```ruby
class AppName < Formula
  desc "Description of the application"
  homepage "https://github.com/fulmenhq/myapp"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/myapp/releases/download/v1.0.0/myapp_v1.0.0_darwin_amd64.tar.gz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end

    on_arm do
      url "https://github.com/fulmenhq/myapp/releases/download/v1.0.0/myapp_v1.0.0_darwin_arm64.tar.gz"
      sha256 "d4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/myapp/releases/download/v1.0.0/myapp_v1.0.0_linux_amd64.tar.gz"
      sha256 "4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce"
    end

    on_arm do
      url "https://github.com/fulmenhq/myapp/releases/download/v1.0.0/myapp_v1.0.0_linux_arm64.tar.gz"
      sha256 "4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a"
    end
  end

  def install
    bin.install "myapp"
  end

  test do
    system bin/"myapp", "--version"
  end
end
```

**Key Points:**
- Class name must be CamelCase version of the app name
- `version` explicitly set (not inferred from URL)
- `on_macos` and `on_linux` blocks for OS-specific binaries
- `on_intel` and `on_arm` blocks for architecture-specific binaries
- SHA256 hashes must match those in `SHA256SUMS`
- Simple `install` method that just moves the binary
- No build dependencies needed (unlike source-based formulas)

### Step 5: Get SHA256 Hashes

Extract the correct SHA256 hashes from the release:

```bash
# From local SHA256SUMS file
cat SHA256SUMS

# Or from GitHub release
gh release view v{VERSION} --repo fulmenhq/{app_name}
curl -sL https://github.com/fulmenhq/{app_name}/releases/download/v{VERSION}/SHA256SUMS
```

### Step 6: Test the Formula Locally

Before committing, test the formula. **Note:** Modern Homebrew (v4.6+) requires formulas to be in taps and no longer accepts file paths.

```bash
# Ensure the tap is set up (if not already)
brew tap fulmenhq/tap $(pwd)

# Copy your updated formula to the tapped location for testing
cp Formula/{app_name}.rb $(brew --repository fulmenhq/tap)/Formula/{app_name}.rb

# Check and fix code style issues (IMPORTANT: run before committing)
brew style --fix fulmenhq/tap

# Audit the formula for common issues (use formula name, not path)
brew audit --strict {app_name}

# Install locally to test
brew install {app_name}

# Test the installed binary
{app_name} --version

# Run the formula's test block
brew test {app_name}

# Uninstall after testing
brew uninstall {app_name}
```

**Important:** The `make style`, `make audit`, and `make test` targets handle the tap setup and formula copying automatically.

### Step 7: Commit and Push Formula

```bash
git add Formula/{app_name}.rb
git commit -m "Update {app_name} to v{VERSION}"
git push origin main
```

### Step 8: Publish the Tap (First Time Only)

If this is the first public release of the tap:

1. Make the homebrew-tap repository public on GitHub
2. Users can then install with:
   ```bash
   brew tap fulmenhq/tap
   brew install fulmenhq/tap/{app_name}
   ```

## Example: Updating goneat

```bash
# In the goneat repository, after building and signing
cd dist/release
gh release upload v0.3.5 --repo fulmenhq/goneat *.tar.gz *.tar.gz.asc *.zip *.zip.asc SHA256SUMS SHA256SUMS.asc

# Get the checksums
cat SHA256SUMS

# In the homebrew-tap repository
cd ../homebrew-tap

# Use the automated update script
make update-goneat VERSION=0.3.5

# Test the formula (automated targets handle tap setup)
make style
make audit APP=goneat
make test APP=goneat
make clean APP=goneat

# Or test manually
brew tap fulmenhq/tap $(pwd)
cp Formula/goneat.rb $(brew --repository fulmenhq/tap)/Formula/goneat.rb
brew style --fix fulmenhq/tap
brew audit --strict goneat
brew install goneat
goneat --version
brew test goneat
brew uninstall goneat

# Commit and push
git add Formula/goneat.rb
git commit -m "Update goneat to v0.3.5"
git push origin main
```

## Troubleshooting

### Brew Audit Rejects File Paths
**Error:** `Error: Calling brew audit [path ...] is disabled! Use brew audit [name ...] instead.`

**Solution:** Modern Homebrew (v4.6+) no longer accepts file paths for audit or install commands. You must:
1. Tap the repository locally: `brew tap fulmenhq/tap $(pwd)`
2. Copy your formula to the tap: `cp Formula/app.rb $(brew --repository fulmenhq/tap)/Formula/app.rb`
3. Use the formula name: `brew audit --strict app`

The `make audit` and `make test` targets handle this automatically.

### SHA256 Mismatch
If you get a SHA256 mismatch error, the checksums in your formula don't match the actual file checksums. Verify:
1. The correct URL is being used
2. The SHA256 hash matches the one in `SHA256SUMS`
3. The file wasn't modified after signing

### Binary Not Found After Installation
Ensure the tarball contains the binary at the root level or adjust the `install` method:
```ruby
class MyApp < Formula
  desc "My application description"
  homepage "https://github.com/fulmenhq/myapp"
  # ... other code ...

  def install
    bin.install "bin/myapp" # if binary is in a bin/ subdirectory
  end
end
```

### Formula Fails Audit
Common issues:
- Missing `test do` block
- Incorrect class name (must be CamelCase)
- Missing license
- Invalid URLs

## Security Considerations

1. **Always verify GPG signatures** when downloading releases
2. **Use HTTPS URLs** for all downloads
3. **Pin specific versions** in the formula (avoid dynamic version resolution)
4. **Keep GPG keys secure** and use separate keys for different purposes if needed
5. **Verify SHA256 checksums** match between `SHA256SUMS` and actual files

## Additional Resources

- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew Formula API](https://rubydoc.brew.sh/Formula)
- [GoReleaser Documentation](https://goreleaser.com/intro/)
- [GitHub CLI Manual](https://cli.github.com/manual/)
