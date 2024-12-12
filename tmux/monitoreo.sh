#!/bin/bash
session_name="Monitoreo"

# Verificar si la sesión existe
if tmux has-session -t "${session_name}" 2>/dev/null; then
    tmux send-keys -t "${session_name}:1" "python ./CodingGaming.py" C-m
    tmux send-keys -t "${session_name}:2" "python ./monitor_energia.py" C-m
else
    echo "La sesión ${session_name} no existe."
fi


