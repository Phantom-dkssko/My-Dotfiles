#!/usr/bin/env bash

VERSION_FILE="VERSION"

echo "=== My Dotfiles - Rice Update ==="
echo

if [ ! -f "$VERSION_FILE" ]; then
    echo "ERRO: arquivo VERSION não encontrado."
    exit 1
fi

CURRENT_VERSION=$(cat "$VERSION_FILE")

echo "Versão atual: v$CURRENT_VERSION"
echo
echo "Verificando alterações..."
git status
