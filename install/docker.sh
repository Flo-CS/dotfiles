section "Docker"
install_packages docker docker-compose
install_yay_packages lazydocker
sudo systemctl enable --now docker.socket # Start on first usage, different from .service which start on boot
