#!/bin/bash

# typescript
echo "(1/5) install nodejs language server"
sudo apt install nodejs npm -y && sudo npm install -g typescript typescript-language-server

# python
echo "(2/5) install python language server"
sudo npm install -g pyright

# c / c++
echo "(3/5) install c/c++ language server"
sudo apt install clangd -y

# rust
echo "(4/5) install rust language server"
sudo apt install rust-analyzer -y
