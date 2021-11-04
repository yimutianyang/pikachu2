folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./train/$v/common.sh \
  --model=Model \
  --emb_dim=128 \
  --feats=user,doc \
  --doc_emb=doc_norm_emb \
  --max_texts=10 \
  --word_emb=word_norm_emb \
  --share_tag_encoder \
  --use_dense \
  --doc_trainable=0 \
  --feed_trainable=0 \
  --task_mlp \
  --weight_loss \
  --mname=$x \
  $*

