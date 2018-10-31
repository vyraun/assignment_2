# assignment_2

* Pre-Run

cd models
pip install -r requirements.txt
pip install docopt

* Commands:

cd scripts

bash build_vocab.sh en-az

bash train.sh en-az

bash decode.sh en-az

* To beat (BLEU Scores):

az-en: 3.0

aztr-en (az with tr): 7.1

be-en: 5.4

beru-en (be with ru): 11.6

gl-en: 16.5

glpt-en (gl with pt): 22.0
