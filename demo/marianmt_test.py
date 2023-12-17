import os

os.environ['HF_ENDPOINT'] = 'https://hf-mirror.com'

from transformers import MarianMTModel, MarianTokenizer

model_name = "Helsinki-NLP/opus-mt-en-ZH"

tokenizer = MarianTokenizer.from_pretrained(model_name)

model = MarianMTModel.from_pretrained(model_name)

src_text = [
    'this is a sample English string to be translated.'
]

translated = model.generate(**tokenizer(src_text, return_tensors="pt", padding=True))

tgt_text = [tokenizer.decode(t, skip_special_tokens=True) for t in translated]

print(tgt_text)

