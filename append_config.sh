#!/bin/bash

SLURM_CONFIG_FILE="slurm_config.txt"
SCRIPTS=("pull_models.sh" "test.sh" "run_python.sh")

if grep -q "ACCOUNT" "$SLURM_CONFIG_FILE"; then
    echo "slurm_config.txt still has the account placeholder. Please update it before running."
    exit 1
fi

for script in "${SCRIPTS[@]}"; do
    # Add SLURM config 
    cat "$SLURM_CONFIG_FILE" >> "$TMP_FILE"
    echo "" >> "$TMP_FILE"

    # Append the rest of the script
    cat "$script" >> "$TMP_FILE"

    # Move temp file back to script
    mv "$TMP_FILE" "$script"
    echo "Updated $script"
done