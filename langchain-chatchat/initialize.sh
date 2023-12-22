#!/bin/sh

source venv/bin/activate

cd Langchain-Chatchat

python copy_config_example.py
python init_database.py --recreate-vs

