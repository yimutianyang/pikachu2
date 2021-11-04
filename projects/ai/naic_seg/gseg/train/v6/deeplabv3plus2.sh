folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./train/${v}/common.sh \
  --model=bonlime.DeeplabV3Plus \
  --backbone=mobilenetv2 \
  --batch_size=16 \
  --mname=$x \
  $*
