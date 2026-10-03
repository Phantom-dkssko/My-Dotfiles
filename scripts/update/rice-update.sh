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
VERSION="${CURRENT_VERSION%-*}"
SUFFIX="${CURRENT_VERSION#*-}"

IFS='.' read -r MAJOR MINOR PATCH <<< "$VERSION"

case "$TYPE" in
    PATCH)
        PATCH=$((PATCH + 1))
        ;;
    MINOR)
        MINOR=$((MINOR + 1))
        PATCH=0
        ;;
    MAJOR)
        MAJOR=$((MAJOR + 1))
        MINOR=0
        PATCH=0
        ;;
esac

NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}-${SUFFIX}"


echo
echo "Nova versão: v$NEW_VERSION"

echo
read -rp "Descrição da alteração: " CHANGE_DESCRIPTION

echo
echo "Verificando alterações..."
git status

echo
read -rp "Confirmar commit? [s/N]: " CONFIRM

if [[ "$CONFIRM" =~ ^[Ss]$ ]]; then
    echo "$NEW_VERSION" > "$VERSION_FILE"
    git add .
    git commit -m "$CHANGE_DESCRIPTION"
    git tag -a "v$NEW_VERSION" -m "$CHANGE_DESCRIPTION"
else
    echo "Commit cancelado."
    exit 0
fi

# teste do sistema de tags
