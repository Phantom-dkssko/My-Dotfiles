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
# Criar lista de versões
# ------------------------------------------------------------

mapfile -t TAGS < <(git tag --sort=-version:refname)

if [ "${#TAGS[@]}" -eq 0 ]; then
    echo "Nenhuma versão encontrada."
    exit 1
fi

# ------------------------------------------------------------
# Argumento opcional
# ------------------------------------------------------------

if [ -n "${1:-}" ]; then

    if [[ "$1" =~ ^[0-9]+$ ]]; then
        SELECTION="$1"

        if [ "$SELECTION" -lt 1 ] || [ "$SELECTION" -gt "${#TAGS[@]}" ]; then
            echo "ERRO: número de versão inválido."
            exit 1
        fi

        TARGET_VERSION="${TAGS[$((SELECTION - 1))]}"

    else

        TARGET_VERSION="$1"

        if [[ "$TARGET_VERSION" != v* ]]; then
            TARGET_VERSION="v$TARGET_VERSION"
        fi

        if ! git rev-parse "$TARGET_VERSION" >/dev/null 2>&1; then
            echo "ERRO: versão '$TARGET_VERSION' não encontrada."
            exit 1
        fi

    fi

else

    # --------------------------------------------------------
    # Mostrar versões numeradas
    # --------------------------------------------------------

    echo "Versões disponíveis:"
    echo

    for i in "${!TAGS[@]}"; do
        NUMBER=$((i + 1))
        echo "[$NUMBER] ${TAGS[$i]}"
    done

    echo
    echo "Total: ${#TAGS[@]} versões"
    echo

    read -rp "Escolha uma versão [1-${#TAGS[@]}]: " SELECTION

    # --------------------------------------------------------
    # Validar seleção
    # --------------------------------------------------------

    if ! [[ "$SELECTION" =~ ^[0-9]+$ ]]; then
        echo
        echo "ERRO: escolha um número."
        exit 1
    fi

    if [ "$SELECTION" -lt 1 ] || [ "$SELECTION" -gt "${#TAGS[@]}" ]; then
        echo
        echo "ERRO: opção inválida."
        exit 1
    fi

    TARGET_VERSION="${TAGS[$((SELECTION - 1))]}"

fi

# ------------------------------------------------------------
# Mostrar informações da versão
# ------------------------------------------------------------

echo
echo "Versão selecionada: $TARGET_VERSION"
echo

git show -s \
    --format="Commit: %h%nData:   %ad%nAutor:  %an%nMensagem: %s" \
    --date=format:"%Y-%m-%d %H:%M" \
    "$TARGET_VERSION"

echo

echo "ATENÇÃO:"
echo "O repositório será colocado exatamente no estado dessa versão."
echo "O Git ficará em estado 'detached HEAD'."
echo
echo "Para voltar ao desenvolvimento atual:"
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
echo "Para voltar ao desenvolvimento atual:"
echo "  git switch main"
