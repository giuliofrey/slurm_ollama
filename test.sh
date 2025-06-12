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


cd /home/ACCOUNT/slurm_ollama

# Run Ollama server
bin/ollama serve &

sleep 10

response=$(curl -s -X POST http://localhost:11434/api/generate -d '{
  "model": "llama3.1:8b",
  "prompt": "What is endogeneity?",
  "stream": false
}' -H "Content-Type: application/json")

# Print the response
echo "Response from server: $response"




