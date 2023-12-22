#!/bin/sh

source venv/bin/activate

pip install -U pip
pip install -U jq wheel torch
pip install -U xformers


if [ ! -d Langchain-Chatchat ]; then
  git clone https://github.com/chatchat-space/Langchain-Chatchat.git
fi

cd Langchain-Chatchat
pip install -r requirements.txt
pip install -r requirements_api.txt
pip install -r requirements_webui.txt

