#!/bin/sh

source venv/bin/activate


pip install -U pip

pip install -U xinference
pip install -U ctransformers
CMAKE_ARGS="-DLLAMA_METAL=on" pip install -U llama-cpp-python


