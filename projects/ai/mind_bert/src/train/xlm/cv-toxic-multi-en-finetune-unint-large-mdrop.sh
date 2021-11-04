folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

RECORD_DIR=../input/tfrecords/xlm
sh ./train/$v/common.sh \
    --pretrained=../working/exps/v2/toxic-multi-en-finetune-unint-large/tf-xlm-roberta-large \
    --train_input=${RECORD_DIR}/validation \
    --valid_input=${RECORD_DIR}/validation \
    --do_test=0 \
    --batch_size=8 \
    --num_gpus=1 \
    --folds=5 \
    --write_valid=1 \
    --cv_save_weights=1 \
    --vie=0.5 \
    --use_multi_dropout=1 \
    --model_dir=../working/exps/$v/$x \
    $*
