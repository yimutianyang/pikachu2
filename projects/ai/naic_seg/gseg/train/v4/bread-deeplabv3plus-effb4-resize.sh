folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./train/${v}/common.sh \
  --model=bread.DeeplabV3Plus \
  --backbone=EfficientNetB4 \
  --deeplab_upmethod=resize \
  --batch_size=16 \
  --mname=$x \
  $*
