folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./run/$v/common.sh \
  --transformer=hfl/chinese-macbert-base \
  --mname=$x \
  $*
