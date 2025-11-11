.PHONY: help update-goneat update audit test clean clean-tap style precommit install-hooks

# Default target
help:
	@echo "FulmenHQ Homebrew Tap - Formula Management"
	@echo ""
	@echo "Usage:"
	@echo "  make update-goneat VERSION=0.3.3        Update goneat formula from GitHub"
	@echo "  make update-goneat VERSION=0.3.3 LOCAL=1  Update goneat formula from local files"
	@echo "  make update APP=goneat VERSION=0.3.3    Update any formula from GitHub"
	@echo "  make style                              Check and fix code style issues"
	@echo "  make precommit                          Run all pre-commit checks (matches CI)"
	@echo "  make install-hooks                      Install git pre-commit hook"
	@echo "  make audit APP=goneat                   Audit a formula"
	@echo "  make test APP=goneat                    Test install a formula"
	@echo "  make clean APP=goneat                   Uninstall a formula"
	@echo "  make clean-tap                          Clean tap state (simulates fresh clone)"
	@echo ""
	@echo "Examples:"
	@echo "  make update-goneat VERSION=0.3.4"
	@echo "  make update APP=myapp VERSION=1.0.0"
	@echo "  make precommit"
	@echo "  make clean-tap && make precommit"

# URL to formula update script (hosted in homebrew-tap-tools repo)
UPDATE_SCRIPT_URL := https://raw.githubusercontent.com/fulmenhq/homebrew-tap-tools/main/update-formula.sh

# Update goneat formula specifically
update-goneat:
ifndef VERSION
	$(error VERSION is required. Usage: make update-goneat VERSION=0.3.3)
endif
	@echo "Downloading update script..."
ifdef LOCAL
	@curl -sSfL $(UPDATE_SCRIPT_URL) | bash -s -- goneat $(VERSION) --local
else
	@curl -sSfL $(UPDATE_SCRIPT_URL) | bash -s -- goneat $(VERSION) --github
endif

# Generic update target for any app
update:
ifndef APP
	$(error APP is required. Usage: make update APP=goneat VERSION=0.3.3)
endif
ifndef VERSION
	$(error VERSION is required. Usage: make update APP=goneat VERSION=0.3.3)
endif
	@echo "Downloading update script..."
ifdef LOCAL
	@curl -sSfL $(UPDATE_SCRIPT_URL) | bash -s -- $(APP) $(VERSION) --local
else
	@curl -sSfL $(UPDATE_SCRIPT_URL) | bash -s -- $(APP) $(VERSION) --github
endif

# Audit a formula for issues
# Note: Modern Homebrew requires formulas to be in taps
audit:
ifndef APP
	$(error APP is required. Usage: make audit APP=goneat)
endif
	@echo "Auditing $(APP) formula..."
	@echo "Ensuring tap is set up..."
	@brew tap fulmenhq/tap $(CURDIR) 2>/dev/null || true
	@mkdir -p $$(brew --repository fulmenhq/tap)/Formula
	@cp Formula/$(APP).rb $$(brew --repository fulmenhq/tap)/Formula/$(APP).rb
	brew audit --strict $(APP)

# Test install a formula locally
# Note: Modern Homebrew requires formulas to be in taps
test:
ifndef APP
	$(error APP is required. Usage: make test APP=goneat)
endif
	@echo "Testing $(APP) formula installation..."
	@echo "Ensuring tap is set up..."
	@brew tap fulmenhq/tap $(CURDIR) 2>/dev/null || true
	@mkdir -p $$(brew --repository fulmenhq/tap)/Formula
	@cp Formula/$(APP).rb $$(brew --repository fulmenhq/tap)/Formula/$(APP).rb
	@echo "This will install $(APP) locally. Press Ctrl+C to cancel or Enter to continue..."
	@read dummy
	brew install $(APP)
	@echo ""
	@echo "Testing installed binary..."
	$(APP) --version
	@echo ""
	@echo "Running formula test..."
	brew test $(APP)
	@echo ""
	@echo "Success! Don't forget to uninstall: make clean APP=$(APP)"

# Clean up - uninstall formula and clean tap state
clean: clean-tap
ifndef APP
	$(error APP is required. Usage: make clean APP=goneat)
endif
	@echo "Uninstalling $(APP)..."
	brew uninstall $(APP) || true
	@echo "✓ Clean complete"

# Clean all tap state (simulates fresh clone)
clean-tap:
	@echo "Cleaning tap state..."
	@echo "Untapping fulmenhq/tap if registered..."
	@brew untap fulmenhq/tap 2>/dev/null || echo "Tap not registered"
	@echo "✓ Tap state cleaned"
	@echo ""
	@echo "Repository is now in fresh clone state"
	@echo "Run 'make precommit' to verify it works from scratch"

# Check and fix code style issues
style:
	@echo "Checking code style..."
	@echo "Running brew audit on formulas..."
	@brew tap fulmenhq/tap $(CURDIR) 2>/dev/null || true
	@cp Formula/*.rb $$(brew --repository fulmenhq/tap)/Formula/ 2>/dev/null || true
	@brew audit --strict goneat
	@echo "✓ Style check passed"

# Run all pre-commit checks (replicates CI test-bot workflow exactly)
precommit:
	@echo "Running pre-commit checks (replicating CI test-bot workflow)..."
	@echo ""
	@echo "1. Running brew test-bot --only-cleanup-before..."
	@brew test-bot --only-cleanup-before
	@echo ""
	@echo "2. Running brew test-bot --only-setup (includes brew doctor, config, etc)..."
	@brew test-bot --only-setup
	@echo ""
	@echo "3. Running brew test-bot --only-tap-syntax..."
	@brew test-bot --only-tap-syntax
	@echo ""
	@echo "4. Checking for unstaged changes..."
	@if [ -n "$$(git status --porcelain)" ]; then \
		echo "✓ Working directory has changes (staged or unstaged)"; \
	else \
		echo "✓ No changes detected"; \
	fi
	@echo ""
	@echo "✓ All pre-commit checks passed - matches CI workflow!"

# Install git pre-commit hook
install-hooks:
	@echo "Installing git pre-commit hook..."
	@mkdir -p .git/hooks
	@echo '#!/bin/sh' > .git/hooks/pre-commit
	@echo 'make precommit' >> .git/hooks/pre-commit
	@chmod +x .git/hooks/pre-commit
	@echo "✓ Pre-commit hook installed"
	@echo ""
	@echo "The hook will run 'make precommit' before each commit."
	@echo "To bypass the hook temporarily, use: git commit --no-verify"

# Full workflow: update, audit, and test
release:
ifndef APP
	$(error APP is required. Usage: make release APP=goneat VERSION=0.3.3)
endif
ifndef VERSION
	$(error VERSION is required. Usage: make release APP=goneat VERSION=0.3.3)
endif
	@echo "Starting full release workflow for $(APP) v$(VERSION)..."
	@echo ""
	@$(MAKE) update APP=$(APP) VERSION=$(VERSION) $(if $(LOCAL),LOCAL=1,)
	@echo ""
	@$(MAKE) style
	@echo ""
	@$(MAKE) audit APP=$(APP)
	@echo ""
	@echo "Review the changes:"
	@git diff Formula/$(APP).rb RELEASE_PROCESS.md
	@echo ""
	@echo "Proceed with test installation? (Ctrl+C to cancel, Enter to continue)"
	@read dummy
	@$(MAKE) test APP=$(APP)
	@echo ""
	@echo "Commit and push? (Ctrl+C to cancel, Enter to continue)"
	@read dummy
	git add Formula/$(APP).rb RELEASE_PROCESS.md
	git commit -m "Update $(APP) to v$(VERSION)"
	git push origin main
	@echo ""
	@echo "Release complete!"
	@$(MAKE) clean APP=$(APP)
