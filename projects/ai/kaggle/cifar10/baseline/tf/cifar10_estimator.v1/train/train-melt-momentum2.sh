python ./train.py \
    --model_dir=./mount/temp/cifar10/model/resnet.momentum2 \
    --batch_size=256 \
    --save_interval_epochs=5 \
    --metric_eval_interval_steps=0 \
    --valid_interval_epochs=1 \
    --inference_interval_epochs=5 \
    --optimizer=momentum \
    --momentum=0.9 \
    --learning_rate=0 \
    --learning_rate_values=0.1,0.01,0.001,0.0002 \
    --learning_rate_epoch_boundaries=82,123,300 \
    --num_epochs=500 \
    --save_interval_steps 10000
