#!/usr/bin/env bash

set -e

# ============================================================
# My Dotfiles - Rice Rollback
# Volta o repositório para uma versão específica
# ============================================================

echo "=== My Dotfiles - Rice Rollback ==="
echo

# ------------------------------------------------------------
# Verificar repositório
# ------------------------------------------------------------

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "ERRO: este script precisa ser executado dentro do repositório."
    exit 1
fi

# ------------------------------------------------------------
# Verificar alterações não salvas
# ------------------------------------------------------------

if [ -n "$(git status --porcelain)" ]; then
    echo "ERRO: existem alterações não salvas no repositório."
    echo
    git status --short
    echo
    echo "Faça commit ou descarte essas alterações antes do rollback."
    exit 1
fi

# ------------------------------------------------------------
# Função para mostrar versões
# ------------------------------------------------------------

show_versions() {
    git tag --sort=-version:refname
}

# ------------------------------------------------------------
# Versão informada por argumento
# ------------------------------------------------------------

if [ -n "${1:-}" ]; then
    TARGET_VERSION="$1"
else
    echo "Versões disponíveis:"
    echo

    TAGS=$(show_versions)

    if [ -z "$TAGS" ]; then
        echo "Nenhuma versão encontrada."
        exit 1
    fi

    echo "$TAGS"
    echo

    read -rp "Digite a versão desejada: " TARGET_VERSION
fi

# ------------------------------------------------------------
# Aceitar versão com ou sem 'v'
# ------------------------------------------------------------

if [[ "$TARGET_VERSION" != v* ]]; then
    TARGET_VERSION="v$TARGET_VERSION"
fi

# ------------------------------------------------------------
# Verificar se a tag existe
# ------------------------------------------------------------

if ! git rev-parse "$TARGET_VERSION" >/dev/null 2>&1; then
    echo
    echo "ERRO: versão '$TARGET_VERSION' não encontrada."
    exit 1
fi

# ------------------------------------------------------------
# Mostrar informações da versão
# ------------------------------------------------------------

echo
echo "Versão selecionada: $TARGET_VERSION"
echo

git show -s \
    --format="Commit: %h%nData:   %ad%nAutor:  %an%nMensagem: %s" \
    --date=format:"%Y-%m-%d %H:%M"

echo

echo "ATENÇÃO:"
echo "O repositório será colocado exatamente no estado dessa versão."
echo "O Git ficará em estado 'detached HEAD'."
echo
echo "Para voltar ao desenvolvimento atual depois:"
echo "  git switch main"
echo

read -rp "Continuar com o rollback? [s/N]: " CONFIRM

if [[ ! "$CONFIRM" =~ ^[Ss]$ ]]; then
    echo
    echo "Rollback cancelado."
    exit 0
fi

# ------------------------------------------------------------
# Realizar rollback
# ------------------------------------------------------------

echo
echo "Realizando rollback para $TARGET_VERSION..."

git switch --detach "$TARGET_VERSION"

echo
echo "=========================================="
echo "Rollback concluído!"
echo "=========================================="
echo
echo "Versão atual: $TARGET_VERSION"
echo
echo "Você está agora no estado dessa versão."
echo
echo "Para voltar ao desenvolvimento atual:"
echo "  git switch main"
