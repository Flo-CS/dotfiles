section "Jinja2"
install_packages python-j2cli

section "Python"
install_packages python-pip

section "Nodejs"
install_packages nvm
insert_content_with_marker ~/.bashrc "nvm" "source /usr/share/nvm/init-nvm.sh"
source ~/.bashrc
nvm install --lts

section "Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
