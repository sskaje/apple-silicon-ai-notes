#!/bin/sh

source venv/bin/activate

python -m fastchat.serve.cli --model-path "$@"

