folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./train/${v}/common.sh \
  --model=sm.Unet \
  --backbone=efficientnetb4 \
  --backbone_weights=../working/pretrain/resisc45/v1/efficientnetb4/model_notop.h5 \
  --mname=$x \
  $*
