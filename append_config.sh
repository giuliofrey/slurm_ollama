#!/bin/bash

SLURM_CONFIG_FILE="slurm_config.txt"
SCRIPTS=("pull_models.sh" "test.sh" "run_python.sh")

if grep -q "HERE" "$SLURM_CONFIG_FILE"; then
    echo "slurm_config.txt still has placeholders. Please update it before running."
    exit 1
fi

for script in "${SCRIPTS[@]}"; do
    # Create a temporary file
    TMP_FILE=$(mktemp)

    # Add SLURM config 
    cat "$SLURM_CONFIG_FILE" >> "$TMP_FILE"
    echo "" >> "$TMP_FILE"

    # Append the rest of the script
    cat "$script" >> "$TMP_FILE"

    # Move temp file back to script
    mv "$TMP_FILE" "$script"
    echo "Updated $script"
done