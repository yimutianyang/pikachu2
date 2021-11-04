folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./run/$v/common.sh \
  --model=Model \
  --emb_dim=128 \
  --dense_feats=video_display,finish_rate_mean,stay_rate_mean,read_comment_rate,like_rate,click_avatar_rate,forward_rate,favorite_rate,comment_rate,follow_rate,actions_rate \
  --count_feats=num_shows,num_actions,video_time2 \
  --feats=user,doc,day,device,author,feed,song,singer,fresh \
  --feats2=manual_keys,machine_keys,manual_tags,machine_tags,desc \
  --max_texts=10 \
  --user_emb=user_valid_norm_emb \
  --doc_emb=doc_valid_norm_emb \
  --author_emb=author_valid_norm_emb \
  --singer_emb=singer_valid_norm_emb \
  --song_emb=song_valid_norm_emb \
  --word_emb=word_norm_emb \
  --share_tag_encoder \
  --use_dense \
  --feed_trainable=1 \
  --task_mlp \
  --weight_loss \
  --mname=$x \
  $*

