folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./run/$v/base.sh \
  --use_words \
  --word_w2v \
  --word_trainable=0 \
  --mname=$x \
  $*

