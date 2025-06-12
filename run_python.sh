#!/bin/bash
#SBATCH --job-name=ollama-test
#SBATCH --account=ACCOUNT HERE
#SBATCH --partition=PARTITION HERE
#SBATCH --ntasks-per-node=1
#SBATCH --gpus=1
#SBATCH --output=out/%x_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=MAIL HERE

# Load necessary modules
# nvidia/cuda-12.4.0

# Activate the environment if needed
#source ~/.bashrc
#conda activate ollama_env  # or source venv/bin/activate

cd /home/ACCOUNT/slurm_ollama

# Run Ollama server
bin/ollama serve &

sleep 10

python run_ollama.py

