#!/bin/bash
# Version bumping script for Orthovision AI FHIR IG
# Usage: ./bump-version.sh [major|minor|patch]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# File to update
SUSHI_CONFIG="$PROJECT_ROOT/src/sushi-config.yaml"

# Function to extract current version
get_current_version() {
    grep "^version:" "$SUSHI_CONFIG" | sed 's/version: //' | tr -d ' '
}

# Function to increment version
bump_version() {
    local version=$1
    local bump_type=$2
    
    IFS='.' read -r major minor patch <<< "$version"
    
    case $bump_type in
        major)
            major=$((major + 1))
            minor=0
            patch=0
            ;;
        minor)
            minor=$((minor + 1))
            patch=0
            ;;
        patch)
            patch=$((patch + 1))
            ;;
        *)
            echo -e "${RED}Error: Invalid bump type. Use 'major', 'minor', or 'patch'${NC}"
            exit 1
            ;;
    esac
    
    echo "$major.$minor.$patch"
}

# Function to update version in file
update_version_in_file() {
    local file=$1
    local old_version=$2
    local new_version=$3
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        sed -i '' "s/version: $old_version/version: $new_version/" "$file"
    else
        # Linux
        sed -i "s/version: $old_version/version: $new_version/" "$file"
    fi
}

# Main script
main() {
    if [ $# -eq 0 ]; then
        echo -e "${RED}Error: No bump type specified${NC}"
        echo "Usage: $0 [major|minor|patch]"
        exit 1
    fi
    
    BUMP_TYPE=$1
    
    # Validate bump type
    if [[ ! "$BUMP_TYPE" =~ ^(major|minor|patch)$ ]]; then
        echo -e "${RED}Error: Invalid bump type '$BUMP_TYPE'${NC}"
        echo "Usage: $0 [major|minor|patch]"
        exit 1
    fi
    
    # Get current version
    CURRENT_VERSION=$(get_current_version)
    
    if [ -z "$CURRENT_VERSION" ]; then
        echo -e "${RED}Error: Could not find version in $SUSHI_CONFIG${NC}"
        exit 1
    fi
    
    # Calculate new version
    NEW_VERSION=$(bump_version "$CURRENT_VERSION" "$BUMP_TYPE")
    
    echo -e "${YELLOW}Current version: $CURRENT_VERSION${NC}"
    echo -e "${GREEN}New version: $NEW_VERSION${NC}"
    echo ""
    
    # Confirm with user
    read -p "Proceed with version bump? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}Aborted${NC}"
        exit 1
    fi
    
    # Update version in sushi-config.yaml
    echo "Updating $SUSHI_CONFIG..."
    update_version_in_file "$SUSHI_CONFIG" "$CURRENT_VERSION" "$NEW_VERSION"
    
    # Check if git is available and repo is clean enough
    if command -v git &> /dev/null; then
        # Stage the changes
        git add "$SUSHI_CONFIG"
        
        # Commit the changes
        git commit -m "Bump version: $CURRENT_VERSION → $NEW_VERSION"
        
        echo -e "${GREEN}✓ Version bumped successfully!${NC}"
        echo -e "${GREEN}✓ Changes committed${NC}"
        echo ""
        echo -e "${YELLOW}Next steps for git flow:${NC}"
        echo "  1. Push this branch: git push"
        echo "  2. Merge release branch to main"
        echo "  3. Tag on main: git tag -a v$NEW_VERSION -m 'Release version $NEW_VERSION'"
        echo "  4. Push with tags: git push origin main --tags"
        echo "  5. Merge back to develop"
    else
        echo -e "${GREEN}✓ Version bumped successfully!${NC}"
        echo -e "${YELLOW}Note: Git not found. Please commit manually.${NC}"
    fi
}

main "$@"
