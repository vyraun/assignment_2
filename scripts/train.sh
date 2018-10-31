#!/bin/sh

lang_pair=${@:1}

vocab="../data/vocab_$lang_pair.bin"
train_src="../data/train.$lang_pair.az.txt"
train_tgt="../data/train.$lang_pair.en.txt"
dev_src="../data/dev.$lang_pair.az.txt"
dev_tgt="../data/dev.$lang_pair.en.txt"
test_src="../data/test.$lang_pair.az.txt"
test_tgt="../data/test.$lang_pair.en.txt"

work_dir="../results/$lang_pair"

mkdir -p ${work_dir}
echo save re

# comment below to test the decoder

python ../models/nmt.py \
    train \
    --cuda \
    --vocab ${vocab} \
    --train-src ${train_src} \
    --train-tgt ${train_tgt} \
    --dev-src ${dev_src} \
    --dev-tgt ${dev_tgt} \
    --save-to ${work_dir}/model.bin \
    --valid-niter 200 \
    --batch-size 32 \
    --hidden-size 512 \
    --embed-size 256 \
    --uniform-init 0.1 \
    --dropout 0.25 \
    --clip-grad 5.0 \
    --lr-decay 0.5 \
    --num-layers 3 \
    --attention-type 'general' \
    --bidirectional

# FOR BIDIRECTIONAL add the flag --bidirectional


#python nmt.py \
#    decode \
#    --cuda \
#    --beam-size 5 \
#    --max-decoding-time-step 100 \
#    ${work_dir}/model.bin \
#    ${test_src} \
#    ${work_dir}/decode.txt

#perl multi-bleu.perl ${test_tgt} < ${work_dir}/decode.txt
