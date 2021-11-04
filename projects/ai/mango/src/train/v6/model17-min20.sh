folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./train/${v}/common.sh \
  --emb_size=128 \
  --min_count=20 \
  --model=Model17 \
  --pooling=dot \
  --mname=$x \
  $*
