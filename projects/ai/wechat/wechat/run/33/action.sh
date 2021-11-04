folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./run/$v/base.sh \
  --model=Model \
  --his_id_feats=feed \
  --his_actions=read_comments,comments,likes,click_avatars,forwards,follows,favorites \
  --mname=$x \
  $*

