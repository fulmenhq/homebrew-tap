.PHONY: help update-goneat update audit test clean

# Default target
help:
	@echo "FulmenHQ Homebrew Tap - Formula Management"
	@echo ""
	@echo "Usage:"
	@echo "  make update-goneat VERSION=0.3.3        Update goneat formula from GitHub"
	@echo "  make update-goneat VERSION=0.3.3 LOCAL=1  Update goneat formula from local files"
	@echo "  make update APP=goneat VERSION=0.3.3    Update any formula from GitHub"
	@echo "  make audit APP=goneat                   Audit a formula"
	@echo "  make test APP=goneat                    Test install a formula"
	@echo "  make clean APP=goneat                   Uninstall a formula"
	@echo ""
	@echo "Examples:"
	@echo "  make update-goneat VERSION=0.3.4"
	@echo "  make update APP=myapp VERSION=1.0.0"
	@echo "  make audit APP=goneat"

# Update goneat formula specifically
update-goneat:
ifndef VERSION
	$(error VERSION is required. Usage: make update-goneat VERSION=0.3.3)
endif
ifdef LOCAL
	@./scripts/update-formula.sh goneat $(VERSION) --local
else
	@./scripts/update-formula.sh goneat $(VERSION) --github
endif

# Generic update target for any app
update:
ifndef APP
	$(error APP is required. Usage: make update APP=goneat VERSION=0.3.3)
endif
ifndef VERSION
	$(error VERSION is required. Usage: make update APP=goneat VERSION=0.3.3)
endif
ifdef LOCAL
	@./scripts/update-formula.sh $(APP) $(VERSION) --local
else
	@./scripts/update-formula.sh $(APP) $(VERSION) --github
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
	@cp Formula/$(APP).rb $$(brew --repository)/Library/Taps/fulmenhq/homebrew-tap/Formula/$(APP).rb
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
	@cp Formula/$(APP).rb $$(brew --repository)/Library/Taps/fulmenhq/homebrew-tap/Formula/$(APP).rb
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

# Clean up - uninstall formula
clean:
ifndef APP
	$(error APP is required. Usage: make clean APP=goneat)
endif
	@echo "Uninstalling $(APP)..."
	brew uninstall $(APP) || true

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
	@$(MAKE) audit APP=$(APP)
	@echo ""
	@echo "Review the changes:"
	@git diff Formula/$(APP).rb
	@echo ""
	@echo "Proceed with test installation? (Ctrl+C to cancel, Enter to continue)"
	@read dummy
	@$(MAKE) test APP=$(APP)
	@echo ""
	@echo "Commit and push? (Ctrl+C to cancel, Enter to continue)"
	@read dummy
	git add Formula/$(APP).rb
	git commit -m "Update $(APP) to v$(VERSION)"
	git push origin main
	@echo ""
	@echo "Release complete!"
	@$(MAKE) clean APP=$(APP)
