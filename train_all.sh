echo "EN-AZ Started"

bash build_vocab.sh en-az > en-az.vocab.txt
bash train.sh en-az > en-az.train.txt
bash decode.sh en-az > en-az.decode.txt

echo "EN-BE Started"

bash build_vocab.sh en-be > en-be.vocab.txt
bash train.sh en-be > en-be.train.txt
bash decode.sh en-be > en-be.decode.txt

echo "EN-GL Started"

bash build_vocab.sh en-gl > en-gl.vocab.txt
bash train.sh en-gl > en-gl.train.txt
bash decode.sh en-gl > en-gl.decode.txt
