folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./run/$v/new.sh \
  --transformer=hfl/chinese-bert-wwm-ext \
  --mname=$x \
  $*
