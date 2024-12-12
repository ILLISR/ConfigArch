#!/bin/zsh

terminal="kitty"

# Verifica si no hay tmux en ejecución, y lo inicia si es necesario
if ! pgrep -u "$USER" tmux >/dev/null; then
    tmux
fi

# Función para listar y seleccionar sesiones de tmux usando rofi
manage_tmux_sessions() {
    # Obtener la lista de sesiones actuales de tmux
    local sessions=$(tmux list-sessions -F "#S" 2>/dev/null)
    local selection
    local action

    # Menú principal con opciones: Seleccionar sesión, Borrar sesión, Crear nueva sesión
    action=$(echo -e "Seleccionar sesión\nBorrar sesión\nCrear nueva sesión" | rofi -i -dmenu -p "¿Qué deseas hacer?" -config ~/.config/rofi/config-compact-proyects.rasi)
    
    # Acción: Seleccionar sesión
    if [[ "$action" == "Seleccionar sesión" ]]; then
        selection=$(echo "$sessions" | rofi -i -dmenu -p "Seleccionar Sesión: " -config ~/.config/rofi/config-compact-proyects.rasi)
        if [[ -n "$selection" ]]; then
            $terminal -e tmux attach-session -t "$selection"
        fi

    # Acción: Borrar sesión
    elif [[ "$action" == "Borrar sesión" ]]; then
        # Permitir seleccionar múltiples sesiones
        selection=$(echo "$sessions" | rofi -i -dmenu -p "Seleccionar sesión para borrar (puedes seleccionar varias con Ctrl): " -config ~/.config/rofi/config-compact-proyects.rasi -multi-select)
        
        # Si se seleccionaron sesiones, borrarlas
        if [[ -n "$selection" ]]; then
            for session in ${(f)selection}; do
                tmux kill-session -t "$session"
            done
        fi

    # Acción: Crear nueva sesión
    elif [[ "$action" == "Crear nueva sesión" ]]; then
        # Preguntar por el nombre de la nueva sesión
        new_session_name=$(rofi -dmenu -p "Nombre de la nueva sesión: " -config ~/.config/rofi/config-compact-proyects.rasi)
        
        # Si el usuario ingresa un nombre válido, crear la nueva sesión
        if [[ -n "$new_session_name" ]]; then
            tmux new-session -d -s "$new_session_name"
            tmux attach-session -t "$new_session_name"
        fi
    fi
}

# Llamar a la función para manejar sesiones de tmux
manage_tmux_sessions

