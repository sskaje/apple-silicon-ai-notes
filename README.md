# Apple Silicon AI Notes


## Prepare

Macbook Pro M3 Max + macOS 14.2

### 1 Python

Using Python 3.9 from System or Python 3.11 from MacPorts

You may meet following error if you use system python.

``` 
.../venv/lib/python3.9/site-packages/urllib3/__init__.py:34: NotOpenSSLWarning: urllib3 v2 only supports OpenSSL 1.1.1+, currently the 'ssl' module is compiled with 'LibreSSL 2.8.3'. See: https://github.com/urllib3/urllib3/issues/3020

```


#### IDE 

Not necessary. 

PyCharm Professional recommended.

### 2 Environment And Dependencies

#### VirtualEnv

Create VirtualEnv

```
# default python
python3 -m venv venv

# macports python3.11
python3.11 -m venv venv311

```

Enter venv

``` 
source ./venv/bin/activate
```

Exit venv
```
deactivate
```


#### Use PyPI China Mirror

*Saves your time if you're in China.*

```

# No Speed Limit, but lack of some packages
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# Speed Limit to around 1MB/s 
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple

# No Speed Limit
pip config set global.index-url https://mirror.baidu.com/pypi/simple

```

#### Install Dependencies

*Don't install these globally or for user, you may meet PATH related errors.*

```
pip install --upgrade pip

pip install mlx
pip install huggingface_hub hf_transfer
pip install sentencepiece

pip install torch
pip install transformers
pip install sacremoses

pip install wheel xformers

```


#### Mirror for HuggingFace

*Saves your time if you're in China.*

``` 
export HF_ENDPOINT=https://p.rst.im/q/huggingface.co/
```


## 3 Demonstration

``` 
# Enter venv

. ./venv/bin/activate 

```


### MLX + LLama 
https://github.com/ml-explore/mlx-examples.git

#### Prepare
```
git clone https://github.com/ml-explore/mlx-examples.git

# options to avoid re-download if already cached 
huggingface-cli download --cache-dir ~/.cache/huggingface/hub --local-dir Llama-2-7b-chat-mlx --local-dir-use-symlinks True  mlx-llama/Llama-2-7b-chat-mlx

```

*Tip: don't try to symlink cache dir to another drive, the hf download script is stupid*

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



### MLX + llm

https://llm.datasette.io/en/stable/

*Chat mode and continuing a conversation are not yet supported.*

Prepare 
``` 
pip install llm 

# install llm mlx plugin
llm install https://github.com/sskaje/llm-mlx-llama/archive/refs/heads/main.zip
# use command below if github.com unreachable
#llm install https://p.rst.im/q/github.com/sskaje/llm-mlx-llama/archive/refs/heads/main.zip
 

```

Test

``` 
# download first 
# huggingface-cli download --cache-dir ~/.cache/huggingface/hub --local-dir Llama-2-7b-chat-mlx --local-dir-use-symlinks True  mlx-llama/Llama-2-7b-chat-mlx

llm -m mlx-llama \
  'five great reasons to get a pet pelican:' \
  -o model Llama-2-7b-chat-mlx \
  -o tokenizer Llama-2-7b-chat-mlx/tokenizer.model

```

### MarianMT Translation

English to Chinese translation.

https://huggingface.co/Helsinki-NLP/opus-mt-en-ZH


``` 
python demo/marianmt_test.py

```


### FastChat 


[Read more ...](./fastchat/)




### Langchain-Chatchat

[Read more ...](./langchain-chatchat/)

### xinference
[Read more ...](./xinference/)


### Text 2 Image 


#### Stable Diffusion WebUI

https://github.com/AUTOMATIC1111/stable-diffusion-webui

**REQUIRES: Python 3.10+**

https://zhuanlan.zhihu.com/p/663332599

```
pip install xformers

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd stable-diffusion-webui

```

Start 

```  
./webui.sh
```

If you have models downloaded, follow the guide to copy model files and run with ` --no-download-sd-model`


#### diffuzers 

https://github.com/abhishekkrthakur/diffuzers

diffuzers requires very old dependencies, use a new venv to install.

``` 
python3 -m venv venv 
. venv/bin/activate

pip install pip --upgrade

pip install diffuzers
pip install altair==4.2.2

# this may report dependency error, but if you don't update, diffuzers won't work
pip install -U accelerate

```

start 
``` 
diffuzers app
```


#### Fooocus

https://github.com/lllyasviel/Fooocus


use python3.11 from macports.

``` 
git clone https://github.com/lllyasviel/Fooocus.git
cd Fooocus

python3.11 -m venv venv
. venv/bin/activate

pip install --upgrade pip
pip install -r requirements_versions.txt

```

Edit files to use [p.rst.im](https://p.rst.im/hf.html) if in China or use `hf.rst.im` as endpoint.

Files: 
* launch.py
* config_modification_tutorial.txt
* modules/config.py

```
sed  -I "" -e 's/huggingface.co/hf.rst.im/g' launch.py config_modification_tutorial.txt modules/config.py
```


start 
``` 
python entry_with_update.py --disable-offload-from-vram
```


## misc 

download options

local-dir-use-symlinks
* auto  : Only some large files are symbolic
* True  : All files will be symbolic
* False : default 
