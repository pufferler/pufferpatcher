#!/bin/bash
set -e # exit when anything fails
echo -e "\npuffer patcher installer\n─────────────────────────────────────"
# check os
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "macos only"
    exit 1
fi
# check python, otherwise install it (implement later)
if ! command -v python3 &>/dev/null; then
    echo "no python go install python"
    exit 1
fi
mkdir -p "$HOME/.pp"
curl -f -S -L https://raw.githubusercontent.com/pufferler/pufferpatcher/main/pp.py \
    -o "$HOME/.pp/pp.py"
echo -e "\ndownloaded (https://raw.githubusercontent.com/pufferler/pufferpatcher/main/pp.py)"
# command creator
sudo tee /usr/local/bin/pufferpatcher > /dev/null << 'stop'
#!/bin/bash
python3 "$HOME/.pp/pp.py" "$@"
stop
sudo chmod +x /usr/local/bin/pufferpatcher # executable
echo "command created (/usr/local/bin/pufferpatcher)"

echo -e "\nall done! run with: pufferpatcher\n"
 