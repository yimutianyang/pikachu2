v=9
model=WideDeep
python ./train.py \
    --later_combine=1 \
    --sparse_to_dense=1 \
    --dynamic_pad=1 \
    --simple_parse=0 \
    --valid_multiplier=10 \
    --deep_final_act=0 \
    --mlp_dims=50 \
    --mlp_drop=0.2 \
    --field_emb=1 \
    --pooling=sum \
    --dense_activation=relu \
    --model=$model \
    --num_epochs=1 \
    --valid_interval_epochs=0.5 \
    --first_interval_epoch=0.1 \
    --train_input=../input/tfrecord/train/*, \
    --valid_input=../input/tfrecord/valid/*, \
    --model_dir=../input/model/v$v/later \
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
