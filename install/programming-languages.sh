log_section "Jinja2"
install_pkgs python-j2cli

log_section "Python"
install_pkgs python-pip

log_section "Nodejs"
install_pkgs nvm
source ~/.bashrc
nvm install --lts

log_section "Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
