base=./mount
dir=$base/temp/ai2018/sentiment/tfrecords/$SRC

fold=0
if [ $# == 1 ];
  then fold=$1
fi 
if [ $FOLD ];
  then fold=$FOLD
fi 

model_dir=$base/temp/ai2018/sentiment/model/v1.1/$fold/$SRC/gru.emb.char.3/
num_epochs=20

mkdir -p $model_dir/epoch 
cp $dir/vocab* $model_dir
cp $dir/vocab* $model_dir/epoch

exe=./train.py 
if [ "$INFER" = "1"  ]; 
  then echo "INFER MODE" 
  exe=./infer.py 
  model_dir=$1
  fold=0
fi

if [ "$INFER" = "2"  ]; 
  then echo "VALID MODE" 
  exe=./infer.py 
  model_dir=$1
  fold=0
fi

python $exe \
        --use_char=1 \
        --char_combiner=concat \
        --fold=$fold \
        --use_label_att=0 \
        --use_self_match=0 \
        --vocab $dir/vocab.txt \
        --model_dir=$model_dir \
        --train_input=$dir/train/'*,' \
        --test_input=$dir/test/'*,' \
        --info_path=$dir/info.pkl \
        --emb_dim 300 \
        --word_embedding_file=$dir/emb.npy \
        --finetune_word_embedding=1 \
        --batch_size 32 \
        --encoder_type=rnn \
        --keep_prob=0.7 \
        --num_layers=1 \
        --rnn_hidden_size=100 \
        --encoder_output_method=max \
        --eval_interval_steps 1000 \
        --metric_eval_interval_steps 1000 \
        --save_interval_steps 1000 \
        --save_interval_epochs=1 \
        --valid_interval_epochs=1 \
        --inference_interval_epochs=1 \
        --freeze_graph=1 \
        --optimizer=adam \
        --learning_rate=0.001 \
        --num_learning_rate_weights=20 \
        --decay_target=loss \
        --decay_patience=1 \
        --decay_factor=0.8 \
        --decay_start_epoch_=2.4 \
        --num_epochs=$num_epochs \

