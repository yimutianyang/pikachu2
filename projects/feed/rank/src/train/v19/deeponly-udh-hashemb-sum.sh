folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./train/${v}/wd.sh \
    --use_qr_embedding=0 \
    --hash_combiner=sum \
    --hash_combiner_ud=sum \
    --deep_only=1 \
    --use_onehot_emb=0 \
    --use_user_emb=1 \
    --use_doc_emb=1 \
    --use_history_emb=1 \
    --model_name=$x \
    $*
    