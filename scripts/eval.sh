#!/bin/sh

vocab="../data/vocab_az-en.bin"
train_src="../data/train.en-az.az.txt"
train_tgt="../data/train.en-az.en.txt"
dev_src="../data/dev.en-az.az.txt"
dev_tgt="../data/dev.en-az.en.txt"
test_src="../data/test.en-az.az.txt"
test_tgt="../data/test.en-az.en.txt"

work_dir="az-en"

mkdir -p ${work_dir}
echo save re

python nmt.py \
    decode \
    --cuda \
    --beam-size 5 \
    --max-decoding-time-step 100 \
    ${work_dir}/model.bin \
    ${test_src} \
    ${work_dir}/decode.txt

perl multi-bleu.perl ${test_tgt} < ${work_dir}/decode.txt
