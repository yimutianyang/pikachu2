v=8
model=WideDeep
python ./train.py \
    --l2_reg=0.001 \
    --duration_weight=1 \
    --sparse_input=0 \
    --dynamic_pad=1 \
    --simple_parse=0 \
    --valid_multiplier=10 \
    --deep_final_act=0 \
    --mlp_dims=50 \
    --mlp_drop=0. \
    --field_emb=1 \
    --pooling=sum \
    --dense_activation=relu \
    --model=$model \
    --num_epochs=2 \
    --valid_interval_epochs=0.5 \
    --first_interval_epoch=0.1 \
    --train_input=$DIR/tfrecord/train/*, \
    --valid_input=$DIR/tfrecord/valid/*, \
    --field_file_path=$DIR/feat_fields.txt \
    --fetat_file_path=$DIR/feature_inex \
    --model_dir=$DIR/model/v$v/dense.weight.l2 \
    --batch_size=512 \
    --max_feat_len=100 \
    --optimizers=bert-lazyadam,bert-lazyadam \
    --learning_rates=0.001,0.01 \
    --opt_weight_decay=0. \
    --opt_epsilon=1e-6 \
    --min_learning_rate=1e-6 \
    --warmup_proportion=0.1 \
    --learning_rate=0.001 \
    $*
