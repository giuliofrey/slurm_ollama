#SBATCH --job-name=ollama-python-test


# Load necessary modules


# Activate the environment if needed
#source activate base
#conda activate ollama_env

cd /home/ACCOUNT/slurm_ollama

# Run Ollama server
bin/ollama serve &

sleep 10

python script.py

