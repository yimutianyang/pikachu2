folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./run/$v/base.sh \
  --merge_vision \
  --use_merge=0 \
  --mname=$x \
  $*

