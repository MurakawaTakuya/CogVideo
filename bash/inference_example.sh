#!/usr/bin/env bash

REPO_ROOT=$(cd "$(dirname "$0")/.." && pwd)

source "$REPO_ROOT/.venv/bin/activate"
cd "$REPO_ROOT/inference"

python cli_demo.py \
    --model_path "$REPO_ROOT/models/CogVideoX1.5-5B" \
    --prompt "A serene mountain landscape at golden hour. A gentle breeze rustles through pine trees as a stream flows over smooth rocks." \
    --output_path "$REPO_ROOT/outputs/output.mp4" \
    --generate_type t2v \
    --num_frames 81 \
    --num_inference_steps 50 \
    --guidance_scale 6.0 \
    --fps 16 \
    --seed 42 \
    --cpu_offload none
    # --cpu_offload none        : GPU全乗せ (94GB GPU推奨、最速)
    # --cpu_offload model       : モデルオフロード (VRAM節約、やや遅い)
    # --cpu_offload sequential  : 完全オフロード (VRAM最小、最遅)
