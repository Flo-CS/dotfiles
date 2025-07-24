log_section "Docker"
install_pkgs docker docker-compose
install_yay_pkgs lazydocker
sudo systemctl enable --now docker.socket # Start on first usage, different from .service which start on boot
