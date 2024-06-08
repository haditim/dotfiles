# Env variables needed for wayland and sway
set -Ux XDG_CURRENT_DESKTOP sway
set -Ux XDG_SESSION_DESKTOP sway
set -Ux ANKI_WAYLAND 1
set -Ux MOZ_ENABLE_WAYLAND 1
set -Ux QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set -Ux CLUTTER_BACKEND wayland
set -Ux GDK_BACKEND wayland
set -Ux ECORE_EVAS_ENGINE wayland_egl
set -Ux ELM_ENGINE wayland_wgl
set -Ux SDL_VIDEODRIVER wayland
set -Ux _JAVA_AWT_WM_NONREPARENTING 1
