folder=$(dirname "$0")
v=${folder##*/}
x=$(basename "$0")
echo $x

bin=./main.py
echo $bin

$bin \
  --wandb_project='wechat_rec' \
  --model="Model" \
  --model_dir="../working/offline/$v/$x" \
  --records_name=tfrecords \
  --records_name2=tfrecords \
  --learning_rate=0.001 \
  --min_learning_rate=1e-06 \
  --optimizer='bert-lazyadam' \
  --batch_size=128 \
  --eval_batch_size=512 \
  --interval_steps=100 \
  --valid_interval_steps=0 \
  --write_valid_final \
  --vie=0.25 \
  --batch_size_per_gpu=0 \
  --fp16 \
  --num_gpus=1 \
  $*

