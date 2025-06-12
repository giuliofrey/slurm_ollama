#SBATCH --job-name=ollama-pull-models


# Load necessary modules
# nvidia/cuda-12.4.0

# Activate the environment if needed
#source ~/.bashrc
#conda activate ollama_env  # or source venv/bin/activate

cd /home/ACCOUNT/slurm_ollama

# Run Ollama server
bin/ollama serve &

sleep 10

bin/ollama pull llama3.1:8b