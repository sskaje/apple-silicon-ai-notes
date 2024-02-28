# xinference

https://github.com/xorbitsai/inference

## Install

```
bash install.sh
```

or 


```

pip install xinference
pip install ctransformers
CMAKE_ARGS="-DLLAMA_METAL=on" pip install llama-cpp-python

# these will report CUDA error
#pip install "xinference[transformers]"
#pip install "xinference[vllm]"

```

start

```
bash start.sh
```

or


``` 
xinference-local
```

Open http://127.0.0.1:9997 in browser.



# inference + qwen  

Type: ggmlv3

Requires
``` 
pip install -U qwen_cpp
``` 

Type: pytorch

**Working!!**



