FROM ubuntu:22.04
# setup the shell so that it uses bash and not /bin/sh
SHELL ["/bin/bash", "-c"]
# Install dependencies
RUN apt-get update -qqq && apt-get install -y wget git build-essential curl bash
# install neovim 0.7.2 
RUN wget -q https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb && echo 'dce77cae95c2c115e43159169e2d2faaf93bce6862d5adad7262f3aa3cf60df8  nvim-linux64.deb' > /tmp/nvim.txt && sha256sum --check /tmp/nvim.txt
RUN dpkg -i nvim-linux64.deb
RUN rm -rf nvim-linux64.deb /tmp/nvim.txt
# setup a new user
RUN adduser --shell /bin/bash -q ubuntu
USER ubuntu
WORKDIR /home/ubuntu
### Install dependencies
# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-installer.sh
RUN chmod +x rustup-installer.sh
RUN ./rustup-installer.sh -y
RUN $HOME/.cargo/bin/rustup install stable
RUN rm -rf rustup-installer.sh
# source the cargo environment - don't need to do this for interactive run since the bashrc will have the lines
RUN source ~/.cargo/env
# install packer for nvim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# copy nvim configs
COPY nvim ~/.config/nvim
CMD ["yes"]
