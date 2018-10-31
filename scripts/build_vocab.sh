lang_pair=${@:1}
source=${lang_pair##*-}

python3 ../models/vocab.py --train-src ../data/train.$lang_pair.$source.txt  --train-tgt ../data/train.$lang_pair.en.txt --vocab-type 'word' --size 10000 ../data/vocab_$lang_pair.bin 
