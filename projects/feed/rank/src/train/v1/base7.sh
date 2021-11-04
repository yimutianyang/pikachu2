model=WideDeep
    #--valid_input=../input/valid \
python ./train.py \
    --simple_parse=1 \
    --valid_multiplier=10 \
    --deep_final_act=0 \
    --mlp_dims=50 \
    --mlp_drop=0.3 \
    --field_emb=1 \
    --pooling=sum \
    --dense_activation=relu \
    --model=$model \
    --num_epochs=2 \
    --eager=0 \
    --valid_interval_epochs=0.5 \
    --first_interval_epoch=0.1 \
    --train_input=../input/train \
    --valid_input=../input/valid \
    --model_dir=../input/model/v1/base7 \
    --batch_size=512 \
    --max_feat_len=100 \
    --optimizer=lazyadam \
    --min_learning_rate=1e-6 \
    --warmup_steps=1000 \
    --learning_rate=0.001 \
    --feat_file_path=../input/feature_index \
    --field_file_path=../input/feat_fields 
