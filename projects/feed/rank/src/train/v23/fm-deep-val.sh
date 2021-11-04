folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

sh ./train/${v}/fm-multi.sh \
    --deep_only=1 \
    --use_deep_val=1 \
    --mlp_dims=512,256,64 \
    --task_mlp_dims=16 \
    --model_name=$x \
    $*
    
