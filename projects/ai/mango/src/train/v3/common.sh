folder=$(dirname "$0")
v=${folder##*/}

x=$(basename "$0")
echo $x

bin=./train.py
#if [ $INFER ];then
#  if [[ $INFER == "1" ]]
#  then
#     bin=./infer.py
#  fi
#fi
echo $bin
# --restore_exclude=global_step,ignore,learning_rate,OptimizeLoss,Adam \
# --train_input="../input/tfrecords/train" \
#  --start_hour=24 \
$bin \
  --model="Baseline" \
  --model_dir="../working/$v/$x" \
  --start_hour=20200524 \
  --valid_span=2 \
  --loop_train \
  --loop_range=0 \
  --loop_fixed_valid \
  --rounds=0 \
  --del_timeout=60 \
  --train_input="../input/tfrecords/train-hours" \
  --test_input="../input/tfrecords/eval" \
  --restore_exclude=global_step,ignore,learning_rate \
  --global_epoch=0 \
  --global_step=0 \
  --learning_rate=0.01 \
  --min_learning_rate=1e-06 \
  --optimizer='bert-adam' \
  --batch_size=512 \
  --interval_steps=100 \
  --valid_interval_steps=100 \
  --valid_interval_epochs=1 \
  --write_summary \
  --write_metric_summary \
  --freeze_graph_final=0 \
  --del_inter_model=1 \
  --async_valid=1 \
  --vie=1 \
  $*

