#!/bin/bash
session_name="FileShield"

# Verificar si la sesión existe
if tmux has-session -t "${session_name}" 2>/dev/null; then
    # Ventana 1: Reactivar el entorno virtual
    tmux send-keys -t "${session_name}:3" "source .venv/bin/activate" C-m
    sleep 1
    tmux send-keys -t "${session_name}:3" "fastapi dev main.py" C-m
    # Ventana 2: Reconectar a la base de datos
    tmux send-keys -t "${session_name}:4" "psql -U sullka -d Malwarebd" C-m
    tmux send-keys -t "${session_name}:5" "lazygit" C-m
    tmux send-keys -t "${session_name}:6" "npm run dev" C-m
else
    echo "La sesión ${session_name} no existe."
fi

