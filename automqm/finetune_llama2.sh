CUDA_VISIBLE_DEVICES=0,1 torchrun --nproc_per_node=2 --master_port=5001 finetune_llama.py \
    --model_name_or_path unsloth/Llama-3.2-3B-Instruct \
    --data_path data/InsScore_data_nodup.json \
    --fp16 True \
    --bf16 False \
    --output_dir checkpoints \
    --num_train_epochs 3 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --gradient_accumulation_steps 32 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 1000 \
    --save_total_limit 1 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0. \
    --logging_steps 10 \
    --log_level info \
    --deepspeed config/deepspeed_zero3_offload.json
