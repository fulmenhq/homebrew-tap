# CI/CD Overview and Runner Design

This document outlines the Continuous Integration and Continuous Deployment (CI/CD) strategy for the FulmenHQ Homebrew Tap. We utilize GitHub Actions to ensure the reliability, security, and compatibility of our Homebrew formulae.

## Runner Architecture

To ensure broad compatibility across different architectures and operating systems, we utilize a specific set of GitHub-hosted runners. This design guarantees that our formulae are tested in environments that closely mirror user setups.

### Selected Runners

We currently target the following runner environments in our `tests.yml` workflow:

*   **`ubuntu-22.04`**: Serves as our standard Linux environment. This ensures that our formulae install and function correctly on Linux-based systems (Linuxbrew), verifying cross-platform compatibility.
*   **`macos-13` (Intel)**: Represents the legacy Intel-based macOS environment. Even as Apple Silicon becomes dominant, maintaining support for Intel Macs remains critical for broader user coverage. `macos-13` (Ventura) is the current standard for Intel-based GitHub Action runners.
*   **`macos-15` (Apple Silicon)**: Represents the modern Apple Silicon (ARM64) environment. Testing on the latest available stable macOS version ensures our software utilizes the performance benefits of modern hardware and remains compatible with the latest macOS updates (Sequoia).

### Why this matrix?

*   **Clean Environment Testing**: Homebrew formulae are highly sensitive to the host environment. By testing on fresh instances of these diverse OS versions, we minimize "it works on my machine" issues.
*   **Architecture Coverage**: Explicitly separating Intel and Apple Silicon runners allows us to catch architecture-specific build or runtime errors that might occur in our Go binaries or dependencies.
*   **Standardization**: We strictly adhere to [GitHub's standard hosted runners](https://docs.github.com/en/actions/reference/runners/github-hosted-runners#standard-github-hosted-runners-for-public-repositories) to ensure build reproducibility and availability.

## CI Workflow: `brew test-bot`

Our primary CI workflow relies on `brew test-bot`. This specialized tool mimics the strict acceptance testing performed by the official Homebrew core team.

### Key Steps

1.  **Setup**: Installs Homebrew and configures the environment.
2.  **Syntax Check**: Runs `brew style` to ensure Ruby code adheres to Homebrew's strict style guide.
3.  **Tap Syntax**: Verifies the tap configuration itself is valid.
4.  **Formula Installation**: Attempts to install the formula from source or binary, verifying checksums and installation instructions.
5.  **Test Block Execution**: Runs the `test do` block defined in the formula to verify the installed binary actually runs and produces expected output.

## Handling Generated Artifacts

Our CI environment is configured to be extremely strict regarding git status. Any file generated during the build process that is not properly ignored will cause a build failure.
*   We explicitly ignore `steps_output.txt` in our `.gitignore` to prevent transient action outputs from breaking the clean-state checks enforced by `brew test-bot`.

## Release Process

Releases are handled separately via the `publish.yml` workflow, which triggers only on specific events (like tagging). This separates the concern of *verifying* code (CI) from *distributing* code (CD), ensuring that only verified code is ever released to users.
