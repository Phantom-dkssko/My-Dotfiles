#!/usr/bin/env bash

set -e

# ============================================================
# My Dotfiles - Rice Versions
# Lista e consulta versões do projeto
# ============================================================

VERSION_FILE="VERSION"

echo "=== My Dotfiles - Versões ==="
echo

# ------------------------------------------------------------
# Verificar repositório
# ------------------------------------------------------------

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "ERRO: este script precisa ser executado dentro do repositório."
    exit 1
fi

# ------------------------------------------------------------
# Ler versão atual
# ------------------------------------------------------------

if [ ! -f "$VERSION_FILE" ]; then
    echo "ERRO: arquivo VERSION não encontrado."
    exit 1
fi

CURRENT_VERSION=$(cat "$VERSION_FILE")

echo "Atual: v$CURRENT_VERSION"
echo

# ------------------------------------------------------------
# Verificar se existem tags
# ------------------------------------------------------------

TAGS=$(git tag --sort=-version:refname)

if [ -z "$TAGS" ]; then
    echo "Nenhuma versão encontrada."
    exit 0
fi

# ------------------------------------------------------------
# Mostrar versões
# ------------------------------------------------------------

echo "Versões disponíveis:"
echo

TOTAL=0

while IFS= read -r TAG; do
    [ -z "$TAG" ] && continue

    TOTAL=$((TOTAL + 1))

    if [ "$TAG" = "v$CURRENT_VERSION" ]; then
        echo "→ $TAG (atual)"
    else
        echo "  $TAG"
    fi
done <<< "$TAGS"

echo
echo "Total: $TOTAL versões"
