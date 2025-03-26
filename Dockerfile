FROM ubuntu:24.04
# Install sudo
RUN apt-get update && apt-get install -y neovim sudo && rm -rf /var/lib/apt/lists/*
# Create user and home directory
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# Switch to the new user by default
USER ubuntu
COPY install.sh /install.sh
RUN sudo sh /install.sh
RUN mkdir /home/ubuntu/workspace && mkdir /home/ubuntu/.config/ && mkdir -p /home/ubuntu/.local/state/nvim && mkdir -p /home/ubuntu/.local/share/nvim
WORKDIR "/home/ubuntu/workspace"
COPY --chown=ubuntu:ubuntu config /home/ubuntu/.config/nvim
COPY lang-serv.sh /home/ubuntu/lang-server.sh
RUN sh /home/ubuntu/lang-server.sh
