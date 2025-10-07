.PHONY: build clean install update-publisher serve help

# Default target
help:
	@echo "Available targets:"
	@echo "  build            - Build the FHIR IG"
	@echo "  clean            - Clean generated files"
	@echo "  install          - Install dependencies"
	@echo "  update-publisher - Update IG Publisher"
	@echo "  serve            - Serve locally for development"
	@echo "  bump-major       - Bump major version (1.0.0 → 2.0.0)"
	@echo "  bump-minor       - Bump minor version (1.0.0 → 1.1.0)"
	@echo "  bump-patch       - Bump patch version (1.0.0 → 1.0.1)"

build:
	cd src && ./_genonce.sh

clean:
	rm -rf src/output/*
	rm -rf src/temp/*
	rm -rf src/fsh-generated/*

install:
	gem install jekyll bundler
	cd src && echo -e "Y\nn\n" | ./_updatePublisher.sh

update-publisher:
	cd src && ./_updatePublisher.sh

serve:
	cd src/output/ && python3 -m http.server 8000

# Version bumping targets
bump-major:
	@chmod +x scripts/bump-version.sh
	@./scripts/bump-version.sh major

bump-minor:
	@chmod +x scripts/bump-version.sh
	@./scripts/bump-version.sh minor

bump-patch:
	@chmod +x scripts/bump-version.sh
	@./scripts/bump-version.sh patch
