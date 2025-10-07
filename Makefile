.PHONY: build clean install update-publisher serve help

# Default target
help:
	@echo "Available targets:"
	@echo "  build            - Build the FHIR IG"
	@echo "  clean            - Clean generated files"
	@echo "  install          - Install dependencies"
	@echo "  update-publisher - Update IG Publisher"
	@echo "  serve            - Serve locally for development"

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
