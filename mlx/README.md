# MLX 
https://github.com/ml-explore/mlx-examples.git


## Prepare

``` 
pip install -U mlx
```


## Run

### mlx-community models

https://hf.rst.im/mlx-community

Use `mlx-llama/Llama-2-7b-chat-mlx` as example.

#### Prepare
```
git clone https://github.com/ml-explore/mlx-examples.git

# options to avoid re-download if already cached 
huggingface-cli download --cache-dir ~/.cache/huggingface/hub --local-dir Llama-2-7b-chat-mlx --local-dir-use-symlinks True  mlx-llama/Llama-2-7b-chat-mlx

```


#### Test 

CLI 
```
python mlx-examples/llama/llama.py Llama-2-7b-chat-mlx/ Llama-2-7b-chat-mlx/tokenizer.model "What's the best Mac product ever"
```


My output: 
```
(venv) sskaje@m3nimum apple-silicon-ai-notes % python mlx-examples/llama/llama.py Llama-2-7b-chat-mlx/ Llama-2-7b-chat-mlx/tokenizer.model "What's the best Mac product ever"

[INFO] Loading model from disk.
Press enter to start generation
------
?

There have been many great Mac products over the years, but some stand out as particularly memorable. Here are some of the best Mac products ever:

1. Macintosh 128k (1984) - This was the original Macintosh, released in 1984. It was the first commercially successful personal computer to use a graphical user interface (GUI), and it revolutionized the way people interacted with computers.
------
[INFO] Prompt processing: 0.348 s
[INFO] Full generation: 4.848 s
```


## Convert & Run


### Qwen

```
cd mlx-examples/
python3.11 -m venv venv
. venv/bin/activate


pip install -U pip 
pip install -U wheel
pip install -U packaging
pip install -U torch
pip install -U numpy
pip install -U mlx 
pip install -U transformers einops transformers_stream_generator
pip install -U tiktoken
```


Run  `Qwen/Qwen-14B-Chat`


Prepare
``` 
export HF_ENDPOINT=https://hf.rst.im

cd llms/qwen

# use symlink to save disk space
huggingface-cli download --cache-dir ~/.cache/huggingface/hub --local-dir Qwen/Qwen-14B-Chat --local-dir-use-symlinks True Qwen/Qwen-14B-Chat

``` 

Convert 
``` 
python convert.py --model Qwen/Qwen-14B-Chat

python convert.py --model Qwen/Qwen-14B-Chat --mlx-path another_mlx_model

```

Run Qwen

``` 
python qwen.py --tokenizer Qwen/Qwen-14B-Chat

python qwen.py --tokenizer Qwen/Qwen-14B-Chat --model-path another_mlx_model

python qwen.py --tokenizer Qwen/Qwen-14B-Chat --prompt="德国有几个州"

python qwen.py --tokenizer Qwen/Qwen-14B-Chat --model-path another_mlx_model --prompt="德国有几个州"


```

My Output

``` 
(venv) sskaje@m3nimum qwen % python qwen.py --tokenizer Qwen/Qwen-14B-Chat

蒙古国的首都是乌兰巴托（Ulaanbaatar）
冰岛的首都是雷克雅未克（Reykjavik）
埃塞俄比亚的首都是亚的斯亚贝巴（Addis Abeba）
尼泊尔的首都是加德满都（Kathmandu）
斯洛文尼亚的首都是卢布尔雅那（Ljubliano）
摩洛哥的首都是拉巴泰（Rabat）
乌拉圭的首都是蒙得维的亚（Montevideo）
坦赞尼亚的首都是多多马（Dodom）
赞比亚的首都是卢萨卡（Lusaka
(venv) sskaje@m3nimum qwen % python qwen.py --tokenizer Qwen/Qwen-14B-Chat --prompt="德国有几个州"

德国有几个州

德国一共有16个州。德国行政区划包括16个联邦州（Bundesland）。

```