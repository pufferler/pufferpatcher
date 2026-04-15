#!/bin/bash
set -e # exit when anything fails
echo -e "\npuffer patcher uninstaller\n─────────────────────────────────────"
# if main bin doesnt exist, assume nothing is installed
if [[ ! -d "$HOME/.pp" ]]; then
    echo "pufferpatcher not even installed"
    exit 0
fi
sudo rm -f /usr/local/bin/pufferpatcher
echo -e "command removed (/usr/local/bin/pufferpatcher)"
rm -rf "$HOME/.pp"
echo "files removed ($HOME/.pp)"

echo -e "\nall done! bye\n"