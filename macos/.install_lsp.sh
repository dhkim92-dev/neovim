#!/bin/bash

PACKAGE_MANAGER="apt"
INSTALL_COMMAND="install"

# c/c++
${PACKAGE_MANAGER} ${INSTALL_COMMAND} clangd

# kotlin
${PACKAGE_MANAGER} ${INSTALL_COMMAND} kotlin-language-server

# rust
${PACKAGE_MANAGER} ${INSTALL_COMMAND} rust-analyzer

# java
#

