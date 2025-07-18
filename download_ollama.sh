#!/bin/bash

curl -L -o ollama.tar.gz https://github.com/ollama/ollama/releases/latest/download/ollama-linux-amd64.tgz
if [ $? -ne 0 ]; then
    echo "Error downloading ollama. Please check your internet connection or the URL."
    exit 1
fi
tar -xzf ollama.tar.gz
if [ $? -ne 0 ]; then
    echo "Error extracting ollama. Please check the downloaded file."
    exit 1
fi
echo "Ollama downloaded and extracted successfully, cleaning up..."
rm ollama.tar.gz