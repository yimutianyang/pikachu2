model=WideDeep
#model=Deep
#model=Wide
    #--valid_input=../input/valid \
python ./pythonly-train.py \
    --sparse_emb=1 \
    --simple_parse=1 \
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
    --train_input=../input/train \
    --valid_input=../input/valid \
    --model_dir=../input/model/pythonly.$model.best.v0.lazyadam2 \
    --batch_size=512 \
    --max_feat_len=100 \
    --optimizer=bert-Adam \
    --optimizer2=bert-SparseAdam \
    --min_learning_rate=1e-6 \
    --warmup_steps=1000 \
    --learning_rate=0.002 \
    --feat_file_path=../input/feature_index \
    --field_file_path=../input/feat_fields.old
