# Langchain-Chatchat on macOS with Apple Silicon


https://github.com/chatchat-space/Langchain-Chatchat.git


## Prepare 

Create VirtualEnv

```
# macports python3.11
python3.11 -m venv venv

bash install.sh

```

Download Models 

Langchain-Chatchat detects models by directory name. 

``` 
export HF_ENDPOINT=https://p.rst.im/q/huggingface.co/

# download models

./download-model.sh DIRECTORY_NAME  MODEL_NAME

``` 

Example
```
export HF_ENDPOINT=https://p.rst.im/q/huggingface.co/

./download-model.sh chatglm3-6b  THUDM/chatglm3-6b
./download-model.sh bge-large-zh BAAI/bge-large-zh

# not working even with qwen_cpp
./download-model.sh Qwen-14B-Chat qwen/Qwen-14B-Chat

```


Initialize

``` 
./initialize.sh

```


To get Langchain-Chatchat work, we need to force this framework using mps by modify `server/utils.py`, find the function `detect_device`, force return "mps" 

Code like: 

```

def detect_device() -> Literal["cuda", "mps", "cpu"]:
    return "mps"
    try:
        import torch
        if torch.cuda.is_available():
            return "cuda"
        if torch.backends.mps.is_available():
            return "mps"
    except:
        pass
    return "cpu"

        
def llm_device(device: str = None) -> Literal["cuda", "mps", "cpu"]:
    return "mps"
    device = device or LLM_DEVICE
    if device not in ["cuda", "mps", "cpu"]:
        device = detect_device()
    return device
        
    
def embedding_device(device: str = None) -> Literal["cuda", "mps", "cpu"]:
    return "mps"
    device = device or EMBEDDING_DEVICE
    if device not in ["cuda", "mps", "cpu"]:
        device = detect_device()
    return device

```



# Start Service
```
./start-service.sh

``` 
