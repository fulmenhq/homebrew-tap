# FulmenHQ Homebrew Tap

This is the official Homebrew tap for the FulmenHQ ecosystem, providing easy installation of CLI tools and utilities developed by FulmenHQ. The tap focuses on Go-based tools to bootstrap development environments for Fulmen projects.

## Quick Start

To get started, tap the repository and install available formulae:

```bash
brew tap fulmenhq/homebrew-tap
brew install goneat  # Install the GoNeat tool
```

Alternatively, install a specific formula directly:

```bash
brew install fulmenhq/homebrew-tap/goneat
```

For a full bootstrap of the Fulmen development environment, use our Brewfile (to be added as more tools are included):

```bash
brew bundle --file=https://raw.githubusercontent.com/fulmenhq/homebrew-tap/main/Brewfile
```

## Available Formulae

- **goneat**: A Go developer tool for neat code and smooth workflows. [GitHub](https://github.com/fulmenhq/goneat)

More tools will be added as the ecosystem grows. Check the [Formula/ directory](https://github.com/fulmenhq/homebrew-tap/tree/main/Formula) for the latest.

## Brewfile for Bootstrap

Create a `Brewfile` in your project to install all Fulmen tools at once (starting with goneat):

```
tap "fulmenhq/homebrew-tap"
brew "goneat"
# Add more as needed
```

Run `brew bundle install` to set up your environment.

## For Maintainers

### Development Environment

Our repository uses specific code formatting standards enforced by CI:

**Code Style Tools:**
- **shfmt**: Shell script formatter (configured for 2 spaces via `.editorconfig`)
- **RuboCop**: Ruby/Formula linter and formatter
- **shellcheck**: Shell script static analysis

**Setup:**
```bash
# Install development tools (if not already installed)
brew install shfmt shellcheck

# Install git pre-commit hook (recommended)
make install-hooks

# Or manually check code style before committing
make precommit

# The style check will automatically fix most issues
```

**Pre-commit Hook:**
We provide a git pre-commit hook that automatically runs style checks before each commit:
- Runs `make precommit` which includes shellcheck, shfmt, and brew audit
- Prevents commits if style checks fail
- To bypass temporarily: `git commit --no-verify`

**EditorConfig:**
We use `.editorconfig` to maintain consistent formatting:
- Shell scripts (`.sh`): 2 spaces
- Ruby files (`.rb`): 2 spaces
- Makefiles: tabs (required)
- End of line: LF (Unix-style)

Most modern editors support EditorConfig automatically. If your editor doesn't, install the EditorConfig plugin.

### Updating Formulas (Automated)

We provide scripts to automate formula updates. After publishing a GitHub release:

```bash
# Quick update from GitHub release
make update-goneat VERSION=0.3.4

# Or for any app
make update APP=myapp VERSION=1.0.0

# Full workflow: update, audit, test, commit, and push
make release APP=goneat VERSION=0.3.4
```

See [RELEASE_PROCESS.md](RELEASE_PROCESS.md) for complete documentation.

## Contributing

We welcome contributions! To add a new formula or update an existing one:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/new-tool`).
3. Add or edit the formula in `Formula/`.
4. Run `brew audit --strict` to check for issues.
5. Test with `brew install --build-from-source fulmenhq/homebrew-tap/<formula>`.
6. Commit and open a Pull Request.

Please follow Homebrew's [formula style guide](https://docs.brew.sh/Formula-Cookbook) and ensure your changes pass CI.

## License

This tap is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

Individual formulae may have their own licenses based on upstream projects.

**Trademarks**: "Fulmen" and "3 Leaps" are trademarks of 3 Leaps, LLC. While code is open source, please use distinct names for derivative works to prevent confusion. See LICENSE for full guidelines.

### OSS Policies (Organization-wide)

- Authoritative policies repository: https://github.com/3leaps/oss-policies/
- Code of Conduct: https://github.com/3leaps/oss-policies/blob/main/CODE_OF_CONDUCT.md
- Security Policy: https://github.com/3leaps/oss-policies/blob/main/SECURITY.md
- Contributing Guide: https://github.com/3leaps/oss-policies/blob/main/CONTRIBUTING.md

## Documentation

For Homebrew usage:
- `brew help`
- `man brew`
- [Homebrew Documentation](https://docs.brew.sh)

For FulmenHQ ecosystem details, visit [github.com/fulmenhq](https://github.com/fulmenhq).

---

---

<div align="center">

⚡ **Start Fast. Thrive on Scale.** ⚡

_Official Homebrew tap for the FulmenHQ ecosystem_

<br><br>

**Built with ⚡ by the 3 Leaps team**
**Part of the [Fulmen Ecosystem](https://fulmenhq.dev) - Lightning-fast enterprise development**

**Signed Binaries** • **Automated Releases** • **Multi-Platform Support**

</div>
