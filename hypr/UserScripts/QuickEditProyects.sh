#!/bin/zsh
# define your preferred text editor and terminal to use
editor=${EDITOR:-nvim}
tty=kitty

# Define el directorio de proyectos
proyectos="$HOME/Proyectos"

# Función para mostrar los elementos del directorio y permitir la selección con rofi
menus(){
    # Listar los archivos/directorios dentro del directorio de proyectos y mostrar en el menú rofi
    seleccion=$(ls "$proyectos" | rofi -i -dmenu -config ~/.config/rofi/config-compact-proyects.rasi | cut -d. -f1)
    # Si se selecciona algo, entonces abrirlo con el editor preferido en el terminal
    if [[ -n "$seleccion" ]]; then
      pwd
      cd "$proyectos/$seleccion"  # Cambiar al directorio del proyecto antes de ejecutar Neovim
      echo "cambiando al directorio : $(pwd)"
      echo "Ejecutando: $tty  \"$editor \"$proyectos/$seleccion\"\""
        $tty -e $editor "$proyectos/$seleccion"   
      else
      echo "No se ha seleccionado nada"
    fi

}

# Llama a la función para ejecutar el menú
menus

