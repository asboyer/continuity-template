.PHONY: help lint format-check test check

# Language-agnostic command hooks.
# Override these in your environment or CI, for example:
#   make lint LINT_CMD="npm run lint"
#   make format-check FORMAT_CHECK_CMD="npm run format:check"
#   make test TEST_CMD="npm test"
LINT_CMD ?= echo "LINT_CMD not configured. Set it for your stack."
FORMAT_CHECK_CMD ?= echo "FORMAT_CHECK_CMD not configured. Set it for your stack."
TEST_CMD ?= echo "TEST_CMD not configured. Set it for your stack."

help:
	@echo "Available targets: lint, format-check, test, check"
	@echo ""
	@echo "This Makefile is stack-neutral."
	@echo "Override command hooks to match your language/toolchain."
	@echo "Example:"
	@echo "  make check LINT_CMD=\"npm run lint\" FORMAT_CHECK_CMD=\"npm run format:check\" TEST_CMD=\"npm test\""

lint:
	@sh -c '$(LINT_CMD)'

format-check:
	@sh -c '$(FORMAT_CHECK_CMD)'

test:
	@sh -c '$(TEST_CMD)'

check: lint format-check test
	@echo "All checks completed."
