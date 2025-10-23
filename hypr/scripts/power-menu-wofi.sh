#!/bin/bash
set -e

# Comandos que quieres ofrecer (puedes borrar los que no uses)
OPTIONS=$'  Apagar\n  Reiniciar\n  Suspender\n⏾  Hibernar\n  Bloquear\n  Cerrar sesión'

# Muestra el menú
choice=$(printf "%s" "$OPTIONS" | wofi --dmenu -i --prompt "Menú de energía")

# Si cancelas, salir silenciosamente
[[ -z "$choice" ]] && exit 0

case "$choice" in
  *Apagar*)      ACTION="systemctl poweroff" ;;
  *Reiniciar*)   ACTION="systemctl reboot" ;;
  *Suspender*)   ACTION="systemctl suspend" ;;
  *Hibernar*)    ACTION="systemctl hibernate" ;;
  *Bloquear*)    # Ajusta a tu locker (hyprlock, swaylock, etc.)
                 ACTION="hyprlock" ;;
  *Cerrar\ sesión*) 
                 # Sale de Hyprland
                 ACTION="hyprctl dispatch exit" ;;
  *) exit 0 ;;
esac

# Confirmación
confirm=$(printf "No\nSí" | wofi --dmenu -i --prompt "¿Confirmar?")
[[ "$confirm" == "Sí" ]] || exit 0

# Ejecuta
eval "$ACTION"

