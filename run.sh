#!/bin/bash
#SBATCH --time=11:59:00
#SBATCH --mem=32G
#SBATCH --gres=gpu:v100:1
#SBATCH --array=1-3
#SBATCH --output=slurmlogs/%A_%a.out
#SBATCH --cpus-per-task=8

# module load python
source ~/varibad/bin/activate
# module load pytorch/1.8.1
module load libffi

# SLURM_ARRAY_TASK_ID=0
python main.py --env-type gridworld_varibad --num_processes 16 --log_file 'grid5_logs_seed'${SLURM_ARRAY_TASK_ID}
# python main.py --env-type gridworld_varibad --num_processes 8 --log_file '2room_logs_seed'${SLURM_ARRAY_TASK_ID} --env_name 'TwoRoomsNavi-v0'
