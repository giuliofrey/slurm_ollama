# slurm_ollama

This project provides scripts and configuration to run [Ollama](https://github.com/ollama/ollama) on a SLURM-managed cluster, including model download, server startup, and Python integration. 

All the scripts do not require sudo privileges and are designed to be run in a user environment.

## Project Structure

- `download.sh` – Downloads and extracts the Ollama binary release.
- `pull_models.sh` – SLURM batch script to start the Ollama server and pull a model.
- `test.sh` – SLURM batch script to test the Ollama server using a curl request.
- `run_python.sh` – SLURM batch script to run a Python test against the Ollama server.
- `script.py` – Python script to test the Ollama Python package.

After the initial setup, the following directories and files will be created:
- `bin/` – Contains the Ollama binary after extraction.
- `lib/` – Contains Ollama's required shared libraries.
- `ollama.tar.gz` – Downloaded Ollama release archive.

## Usage

```sh
git clone repo_url
cd slurm_ollama
# Download the Ollama binary
bash [download.sh]
# Pull a model using SLURM
sbatch pull_models.sh
# Test the Ollama server
sbatch test.sh
# Run a Python test against the Ollama server
sbatch run_python.sh
```