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

## Contributing

We welcome contributions! To add a new formula or update an existing one:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/new-tool`).
3. Add or edit the formula in `Formula/`.
4. Run `brew audit --strict` to check for issues.
5. Test with `brew install --build-from-source fulmenhq/homebrew-tap/<formula>`.
6. Commit and open a Pull Request.

Please follow Homebrew's [formula style guide](https://docs.brew.sh/Formula-Cookbook) and ensure your changes pass CI.

For OSS policies, contribution guidelines, and governance, please refer to the FulmenHQ README at ~/dev/fulmenhq/README.md, which links to 3 Leaps' open-source policies in the 3leaps organization.

## License

This tap is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

Individual formulae may have their own licenses based on upstream projects.

## Documentation

For Homebrew usage:
- `brew help`
- `man brew`
- [Homebrew Documentation](https://docs.brew.sh)

For FulmenHQ ecosystem details, visit [github.com/fulmenhq](https://github.com/fulmenhq).
