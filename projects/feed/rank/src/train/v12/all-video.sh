v=12
source ./config2.sh
# for example training data is 2019101321 2hours valid data is 2019101322 1hour
# sh ./train/v10/base.sh 2019101321_2 2019101322_1
#export DIR=$base_dir
export DIR=/home/gezi/tmp/rank/data/video_hour_sgsapp_v2
#train_dir=$DIR/2019102415/tfrecords
start_hour=$1
interval=24
valid_interval_epochs='0.1'
if (($# > 1))
then
interval=$2
  if (($interval==1))
  then
    valid_interval_epochs='1'
    EVAL_FIRST=0
  fi
fi
valid_hour=$start_hour
if (($# > 2))
then
valid_hour=$3
fi

interval_dirs()
{
    input_dir=$1
    start_hour=$2
    interval=$3
    input=''

    for ((i=1; i<=$interval; ++i))
    do
        ts_day=`date -d"${start_hour:0:8} ${start_hour:8:10} -${i}hours" +"%Y%m%d"`
        ts_hour=`date -d"${start_hour:0:8} ${start_hour:8:10} -${i}hours" +"%Y%m%d%H"`
        sample_input="$input_dir/tfrecords/$ts_hour"
        # echo 'sample input: '$sample_input
        # hadoop fs $name_password -test -e $sample_input
        # if [ $? -eq 0 ];then
        input="${sample_input},${input}"
        # echo 'input: '$input
        # fi
    done
    input=${input:0:-1}
    
    echo $input
}

train_dir=$(interval_dirs $DIR $start_hour $interval)
valid_dir=$DIR/tfrecords/$valid_hour

echo $train_dir 
echo $valid_dir 

#--restore_exclude=global_step,ignore,learning_rate,dense_1 \
model=WideDeep
python ./train.py \
    --valid_hour=$valid_hour \
    --restore_exclude=global_step,ignore,learning_rate \
    --hash_encoding=1 \
    --feature_dict_size=20000000 \
    --num_feature_buckets=3000000 \
    --field_dict_size=10000 \
    --duration_weight=1 \
    --sparse_to_dense=1 \
    --dynamic_pad=1 \
    --simple_parse=0 \
    --valid_multiplier=1 \
    --deep_final_act=0 \
    --mlp_dims=50 \
    --mlp_drop=0. \
    --field_emb=0 \
    --pooling=sum \
    --dense_activation=relu \
    --model=$model \
    --num_epochs=1 \
    --valid_interval_epochs=$valid_interval_epochs \
    --first_interval_epoch=-1 \
    --train_input=$train_dir, \
    --valid_input=$valid_dir, \
    --model_dir=$DIR/exp/model.all \
    --batch_size=512 \
    --max_feat_len=100 \
    --optimizers=bert-lazyadam,bert-lazyadam \
    --learning_rates=0.001,0.01 \
    --opt_weight_decay=0. \
    --opt_epsilon=1e-6 \
    --min_learning_rate=1e-6 \
    --warmup_proportion=0.1 \
    --learning_rate=0.001 \
    --write_valid=0 \
    --disable_model_suffix=1 \
    --eval_group=1 \
    --use_wide_position_emb=0 \
    --use_deep_position_emb=0 \
    --position_combiner=concat \
    --min_filter_duration=5 \
    --min_click_duration=1 \
    --interests_weight=0 \
    --interests_weight_type=clip \
    --min_interests=0 \
    --duration_weight_nolog=1 \
    --duration_weight_multiplier=0.05 \
    --multi_obj_duration=1 \
    --multi_obj_duration_loss=sigmoid_cross_entropy \
    --multi_obj_duration_ratio=0. \
    --masked_fields=3778 \
    --use_user_emb=1 \
    --use_doc_emb=1 \
    --use_history_emb=1 \
    --hidden_size=32 \
    --change_cb_user_weight=1 \
    --cb_user_weight=0.1 \
    $*
