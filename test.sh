#!/bin/bash

# Function to check if a file contains the dependsOn field
check_dependsOn() {
    local file="$1"
    if grep -q "dependsOn:" "$file"; then
        local dependencies=$(grep "dependsOn:" "$file" | cut -d ':' -f2)
        echo "$file depends on $dependencies"
    fi
}

# Export the function so it's available to parallel
export -f check_dependsOn

# Find all helmrelease.yaml files and check for dependsOn field
# Uses GNU Parallel to perform the checks in parallel
find . -name 'helmrelease.yaml' | while read -r file; do check_dependsOn "$file"; done
