# Slurm Ollama

This repository provides scripts and configuration to run [Ollama](https://github.com/ollama/ollama) on a SLURM-managed cluster, including model download, server startup, and Python integration. 

All the scripts do not require sudo privileges and are designed to be run in a user environment.

## Structure

- `append_config.sh` – Appends necessary configurations to the SLURM configuration file.
- `download_ollama.sh` – Downloads and extracts the Ollama binary release.
- `pull_models.sh` – SLURM batch script to start the Ollama server and pull a model.
- `script.py` – Python script to test the Ollama Python package.
- `slurm_config.txt` – Template SLURM configuration file to append necessary settings for Ollama.
- `test_python.sh` – SLURM batch script to run a Python test against the Ollama server.
- `test.sh` – SLURM batch script to test the Ollama server using a curl request.

After the initial setup, the following directories and files will be created:
- `bin/` – Contains the Ollama binary after extraction.
- `lib/` – Contains Ollama's required shared libraries.
- `ollama.tar.gz` – Downloaded Ollama release archive.

## Setup

```sh
git clone https://github.com/giuliofrey/slurm_ollama
cd slurm_ollama
```

Once the repository is cloned, you need to modify the following scripts to suit your environment:
- `slurm_config.txt`: update the SLURM configuration settings as needed.
- `pull_models.sh`: pulls llama.3.1:8b, you can change this to any other model available on Ollama.
- `test.sh`: uses a curl command to test the Ollama server, you can modify the URL or parameters as needed.
- `run_python.sh`: specify the Python environment or virtual environment you want to use. 
- `script.py`: modify the script to test use the desired model and parameters.

You will also need to install the Ollama Python package in your Python environment. In conda environments, you can do this with:
```sh
conda activate ollama_env
# Install the Ollama Python package
pip install ollama
```

## Usage

```sh
# Download the Ollama binary
bash download_ollama.sh
# Append the SLURM configuration
bash append_config.sh
# Pull a model using SLURM
sbatch pull_models.sh
# Test the Ollama server
sbatch test.sh
# Run a Python test against the Ollama server
sbatch test_python.sh
```
