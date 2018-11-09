#!/bin/sh

lang_pair=${@:1}
source=${lang_pair##*-}
target=${lang_pair%-*} 

echo source $source
echo target $target

vocab="../data/vocab_lm.bin"
train_src="../data/lm_wiki_train.txt"
train_tgt="../data/lm_wiki_train.txt"
dev_src="../data/lm_wiki_dev.txt"
dev_tgt="../data/lm_wiki_dev.txt"

work_dir="results/$lang_pair"

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
    --valid-niter 800 \
    --batch-size 32 \
    --hidden-size 256 \
    --embed-size 256 \
    --uniform-init 0.1 \
    --dropout 0.2 \
    --clip-grad 5.0 \
    --lr-decay 0.5 \
    --num-layers 1 \
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
