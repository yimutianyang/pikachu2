folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./train/${v}/common.sh \
  --model='Baseline3' \
  --loss='loss_mse' \
  --mname=$x \
  $*