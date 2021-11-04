python trainer.py \
    --node_num=1 \
    --device_num=1 \
    --train_data_dir="/search/odin/publicData/CloudS/yuwenmengke/rank_0804_so/shida/data/video_hour_shida_v1/ofrecords/2020062422" \
    --data_part_num=50 \
    --batch_size_per_device=512 \
    --max_steps=11359 \
    --primary_lr=0.001 \
    --loss_print_steps=100 \
    --pretrain_model_path='' \
    --model_save_path='snapshots' \
    --weight_l2=0
