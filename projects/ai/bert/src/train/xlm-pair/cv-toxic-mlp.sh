folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x
x=${x%.*}

bin=./train.py
# --train_input=../input/tfrecords/xlm/jigsaw-unintended-bias-train \
#    --train_input=../input/tfrecords/xlm/jigsaw-toxic-comment-train \
#    --pretrained=../input/tf-xlm-roberta-base \
$bin \
    --model=XlmModel \
    --use_mlp=1 \
    --train_input=../input/tfrecords/xlm/validation \
    --pretrained=../input/tf-xlm-roberta-base \
    --pretrained2=../working/exps/v2/toxic-multi-en-finetune-unint/lang_model_weight.h5 \
    --valid_input=../input/tfrecords/xlm/validation \
    --test_input=../input/tfrecords/xlm/test \
    --interval_steps=100 \
    --valid_interval_steps=100 \
    --verbose=1 \
    --num_epochs=1 \
    --keras=1 \
    --buffer_size=2048 \
    --learning_rate=3e-5 \
    --optimizer=bert-adamw \
    --metrics='' \
    --test_names=id,toxic \
    --valid_interval_epochs=0 \
    --do_test=0 \
    --batch_size=32 \
    --num_gpus=1 \
    --num_train=8000 \
    --num_valid=1600 \
    --folds=5 \
    --write_valid=1 \
    --cv_save_weights=1 \
    --model_dir=../working/exps/$v/$x \
    $*
