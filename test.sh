#SBATCH --job-name=ollama-test

# Load necessary modules
# nvidia/cuda-12.4.0


cd "$HOME/slurm_ollama"

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




