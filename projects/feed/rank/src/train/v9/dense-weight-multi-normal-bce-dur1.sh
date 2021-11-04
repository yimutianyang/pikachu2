v=9
model=WideDeep
python ./train.py \
    --multi_obj_duration=1 \
    --multi_obj_duration_loss=sigmoid_cross_entropy \
    --multi_obj_duration_ratio=1. \
    --duration_scale=normal \
    --duration_weight=1 \
    --sparse_to_dense=1 \
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
    --num_epochs=1 \
    --valid_interval_epochs=0.5 \
    --first_interval_epoch=0.1 \
    --train_input=$DIR/tfrecord/train/*, \
    --valid_input=$DIR/tfrecord/valid/*, \
    --field_file_path=$DIR/feat_fields.txt \
    --fetat_file_path=$DIR/feature_inex \
    --model_dir=$DIR/model/v$v/dense.weight.multi.normal.bce.dur1 \
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
