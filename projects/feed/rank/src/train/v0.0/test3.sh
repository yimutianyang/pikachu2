model=WideDeep
    #--valid_input=../input/valid \
python ./train.py \
    --buffer_size=512000 \
    --valid_multiplier=10 \
    --deep_final_act=0 \
    --mlp_dims=50 \
    --mlp_drop=0.2 \
    --field_emb=1 \
    --pooling=sum \
    --dense_activation=relu \
    --model=$model \
    --num_epochs=2 \
    --eager=0 \
    --valid_interval_epochs=0.1 \
    --train_input=../input/tfrecord/train.old \
    --valid_input=../input/tfrecord/valid \
    --model_dir=../input/model/test3 \
    --batch_size=512 \
    --max_feat_len=100 \
    --optimizer=bert \
    --min_learning_rate=1e-6 \
    --warmup_steps=1000 \
    --learning_rate=0.001 \
    --feat_file_path=../input/feature_index \
    --field_file_path=../input/feat_fields.old
