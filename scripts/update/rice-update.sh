#!/usr/bin/env bash

set -e

# ============================================================
# My Dotfiles - Rice Update
# Sistema de versionamento e atualização do projeto
# ============================================================

VERSION_FILE="VERSION"
CHANGELOG_FILE="CHANGELOG.md"

echo "=== My Dotfiles - Rice Update ==="
echo

# ------------------------------------------------------------
# Verificar se estamos dentro do repositório
# ------------------------------------------------------------

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "ERRO: este script precisa ser executado dentro do repositório."
    exit 1
fi

# ------------------------------------------------------------
# Verificar arquivo VERSION
# ------------------------------------------------------------

if [ ! -f "$VERSION_FILE" ]; then
    echo "ERRO: arquivo VERSION não encontrado."
    exit 1
fi

CURRENT_VERSION=$(cat "$VERSION_FILE")

echo "Versão atual: v$CURRENT_VERSION"
echo

# ------------------------------------------------------------
# Escolher tipo da atualização
# ------------------------------------------------------------

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

# ------------------------------------------------------------
# Calcular nova versão
# ------------------------------------------------------------

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

echo "Nova versão: v$NEW_VERSION"
echo

# ------------------------------------------------------------
# Descrição
# ------------------------------------------------------------

read -rp "Descrição da alteração: " CHANGE_DESCRIPTION

if [ -z "$CHANGE_DESCRIPTION" ]; then
    echo
    echo "ERRO: a descrição não pode ficar vazia."
    exit 1
fi

echo

# ------------------------------------------------------------
# Verificar alterações
# ------------------------------------------------------------

echo "Alterações que serão incluídas:"
echo

git status --short

echo

# ------------------------------------------------------------
# Confirmação
# ------------------------------------------------------------

echo "Resumo:"
echo "  Versão atual : v$CURRENT_VERSION"
echo "  Nova versão  : v$NEW_VERSION"
echo "  Tipo         : $TYPE"
echo "  Descrição    : $CHANGE_DESCRIPTION"
echo

read -rp "Confirmar atualização? [s/N]: " CONFIRM

if [[ ! "$CONFIRM" =~ ^[Ss]$ ]]; then
    echo
    echo "Atualização cancelada."
    exit 0
fi

# ------------------------------------------------------------
# Atualizar VERSION
# ------------------------------------------------------------

echo "$NEW_VERSION" > "$VERSION_FILE"

# ------------------------------------------------------------
# Atualizar CHANGELOG
# ------------------------------------------------------------

if [ -f "$CHANGELOG_FILE" ]; then
    TEMP_CHANGELOG=$(mktemp)

    {
        echo "# Changelog"
        echo
        echo "## v$NEW_VERSION"
        echo
        echo "- $CHANGE_DESCRIPTION"
        echo
        tail -n +2 "$CHANGELOG_FILE"
    } > "$TEMP_CHANGELOG"

    mv "$TEMP_CHANGELOG" "$CHANGELOG_FILE"
else
    cat > "$CHANGELOG_FILE" <<EOF
# Changelog

## v$NEW_VERSION

- $CHANGE_DESCRIPTION
EOF
fi

# ------------------------------------------------------------
# Git add
# ------------------------------------------------------------

git add .

# ------------------------------------------------------------
# Commit
# ------------------------------------------------------------

if git commit -m "$CHANGE_DESCRIPTION"; then

    # --------------------------------------------------------
    # Criar tag
    # --------------------------------------------------------

    if git tag -a "v$NEW_VERSION" -m "$CHANGE_DESCRIPTION"; then
        echo
        echo "=========================================="
        echo "Atualização concluída!"
        echo "=========================================="
        echo
        echo "Versão: v$NEW_VERSION"
        echo "Tag:    v$NEW_VERSION"
        echo
        echo "Commit criado e tag criada com sucesso."
    else
        echo
        echo "ERRO: o commit foi criado, mas a tag falhou."
        exit 1
    fi

else
    echo
    echo "ERRO: o commit falhou."
    echo "A atualização da versão será revertida."

    git restore "$VERSION_FILE"

    exit 1
fi
