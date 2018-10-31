lang_pair=${@:1}
python3 ../models/vocab.py --train-src ../data/train.$lang_pair.az.txt  --train-tgt ../data/train.$lang_pair.en.txt --vocab-type 'word' --size 10000 ../data/vocab_$lang_pair.bin 
