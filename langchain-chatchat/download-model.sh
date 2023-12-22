#!/bin/sh

source venv/bin/activate

cd Langchain-Chatchat

huggingface-cli download --cache-dir ~/.cache/huggingface/hub --local-dir-use-symlinks True --local-dir "$@"
