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

echo "Escolha o tipo de atualização:"
echo
echo "[1] PATCH  - Correção pequena"
echo "[2] MINOR  - Nova função/configuração"
echo "[3] MAJOR  - Mudança grande"
echo

read -rp "Escolha [1-3]: " UPDATE_TYPE

case "$UPDATE_TYPE" in
    1)
        TYPE="PATCH"
        ;;
    2)
        TYPE="MINOR"
        ;;
    3)
        TYPE="MAJOR"
        ;;
    *)
        echo
        echo "Opção inválida."
        exit 1
        ;;
esac

echo
echo "Tipo selecionado: $TYPE"
echo
echo "Verificando alterações..."
git status
