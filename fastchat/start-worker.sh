#!/bin/sh

source venv/bin/activate

python -m fastchat.serve.model_worker --model-path "$@"
