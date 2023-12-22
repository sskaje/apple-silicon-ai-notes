#!/bin/sh

source venv/bin/activate

python -m fastchat.serve.model_worker --device mps --model-path "$@"
