if [[ "$OSTYPE" =~ ^darwin ]]; then
    export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/local/opt/python@3.11/libexec/bin:/Users/alex/.local/bin:$PATH
fi

if [[ "$OSTYPE" =~ ^linux ]]; then
    export PATH=/home/lx/.local/bin:$PATH
fi

export NVM_DIR="$HOME/.nvm"

export CLOUDSDK_PYTHON=/usr/local/bin/python3
