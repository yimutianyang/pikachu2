folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./train/${v}/base.sh \
  --use_history \
  --use_vid \
  --use_uinfo \
  --use_prev_info \
  --use_class_info \
  --use_stars \
  --use_title \
  --use_story \
  --use_others \
  --use_crosses=1 \
  --use_image=1 \
  --use_his_image=1 \
  --train_image_emb=1 \
  --use_history_class \
  --use_last_class \
  --use_last_vid \
  --use_dense \
  --use_dense_his_durs \
  --use_dense_prev_info \
  --his_encoder='' \
  --his_pooling=mhead \
  --din_normalize \
  --use_position_emb \
  --use_titles \
  --use_last_title=0 \
  --use_first_star \
  --use_last_stars=0 \
  --use_stars_list \
  --title_pooling=att \
  --stars_pooling=att \
  --emb_size=300 \
  --vid_pretrain=../input/all/glove-300/emb.npy \
  --words_pretrain=../input/all/glove-words-300/emb.npy \
  --model=Model \
  --mname=$x \
  $*
