#!/bin/sh
source /root/.bashrc
psyduck
export LANG=zh_CN.UTF-8

export MARK=tuwen
source ./conf/config.sh $MARK

start_hour=$1

if (($METRIC==1))
then
  train_dir=$DIR/tfrecords/${start_hour}
  valid_dir=$train_dir
  num_valid=0
else
 train_dir=$DIR/tfrecords/${start_hour}
 valid_dir=$train_dir
 num_valid=500000
fi

echo 'train_dir' $train_dir
echo 'valid_dir' $valid_dir

abtestid=18

model_dir=$DIR2/model/${abtestid}
version=tuwen.ab${abtestid}.dlrm-att

sh ./train/libowei/dlrm-att.sh \
  --click_power=1.3 \
  --dur_power=0.7 \
  --model_mark=${abtestid} \
  --train_loop=0 \
  --valid_hour=${start_hour} \
  --min_train=10000 \
  --model_dir=$model_dir \
  --model_name='' \
  --train_input=$train_dir \
  --valid_input=$valid_dir \
  --num_valid=$num_valid \
  $*

#MARK=video V=2 sh ./train/v25/dlrm.sh --click_power=1.3 --dur_power=0.7 --model_mark=8 --model_dir=${model_dir} --model_name="" --data_version=2 --loop_train=0 --num_steps=-3 --train_input=/search/odin/libowei/rank/data_v2/video/tfrecord.*
