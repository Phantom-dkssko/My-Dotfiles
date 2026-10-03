# 🐧 My Dotfiles

Meu ambiente Linux, configurações, comandos úteis, scripts e documentação.

---

# 📁 Estrutura

* `hyprland/` — Configurações do Hyprland
* `waybar/` — Configuração da Waybar
* `wofi/` — Configuração do Wofi
* `kitty/` — Configuração do Kitty
* `fish/` — Configuração do Fish
* `dolphin/` — Configurações relacionadas ao Dolphin
* `fastfetch/` — Configuração do Fastfetch
* `wallpapers/` — Wallpapers
* `themes/` — Temas
* `icons/` — Ícones
* `commands/` — Comandos úteis do Linux e aplicativos
* `scripts/` — Scripts do projeto
* `shortcuts/` — Atalhos de teclado
* `packages/` — Lista de pacotes
* `docs/` — Documentação
* `screenshots/` — Capturas do rice

---

# ✏️ Como modificar o projeto

O projeto fica armazenado em duas partes:

```text
Computador
    ↓
Repositório Git local
    ↓
GitHub
```

As alterações são feitas primeiro no computador.

Depois usamos o Git para registrar e enviar essas alterações para o GitHub.

## 📄 Editar um arquivo

Por exemplo, para editar o README:

```bash
nano README.md
```

Para editar a configuração do Hyprland:

```bash
nano hyprland/hyprland.conf
```

Você também pode usar um editor gráfico, como VS Code.

---

## 📁 Criar uma pasta

Exemplo:

```bash
mkdir nome-da-pasta
```

Criar uma pasta dentro de outra:

```bash
mkdir -p commands/linux
```

---

## 📄 Criar um arquivo

```bash
touch arquivo.md
```

Exemplo:

```bash
touch commands/linux/network.md
```

---

## 🗑️ Remover um arquivo

```bash
rm arquivo.md
```

⚠️ Tenha cuidado com `rm`, pois ele remove o arquivo.

---

# 🔧 Git

## Ver o estado do projeto

```bash
git status
```

Mostra o que foi modificado, criado ou removido.

---

## Ver exatamente o que mudou

```bash
git diff
```

Mostra as alterações feitas nos arquivos.

---

## Adicionar alterações

```bash
git add .
```

Coloca as alterações na área que será usada para criar o próximo commit.

---

## Criar uma versão

```bash
git commit -m "Descrição da mudança"
```

Exemplo:

```bash
git commit -m "Atualiza configuração do Waybar"
```

Um commit funciona como um ponto salvo no histórico do projeto.

---

## Enviar para o GitHub

```bash
git push
```

Envia os commits que estão no computador para o GitHub.

---

## Baixar alterações do GitHub

```bash
git pull
```

Atualiza o repositório local com as alterações que estão no GitHub.

---

# 🔄 Fluxo normal

Quando você modificar qualquer coisa:

```bash
git status
```

↓

```bash
git diff
```

↓

```bash
git add .
```

↓

```bash
git commit -m "Descrição da mudança"
```

↓

```bash
git push
```

---

# 🕐 Histórico

Ver todas as versões:

```bash
git log --oneline
```

Exemplo:

```text
a31f92c Atualiza Waybar
7bc812a Novo tema
31ac221 Configuração inicial
```

Cada código representa um commit.

---

# ⏪ Voltar para uma versão antiga

Primeiro veja o histórico:

```bash
git log --oneline
```

Depois você pode acessar uma versão específica:

```bash
git checkout ID_DO_COMMIT
```

Exemplo:

```bash
git checkout a31f92c
```

⚠️ O sistema de rollback automático será criado posteriormente em `scripts/rollback/`.

---

# 🔗 Conexão com o GitHub

Ver qual GitHub está conectado:

```bash
git remote -v
```

Adicionar um GitHub:

```bash
git remote add origin URL_DO_REPOSITORIO
```

Alterar o GitHub conectado:

```bash
git remote set-url origin URL_DO_REPOSITORIO
```

---

# 👤 Configuração do Git

Ver seu nome:

```bash
git config --global user.name
```

Ver seu e-mail:

```bash
git config --global user.email
```

Alterar seu nome:

```bash
git config --global user.name "Seu Nome"
```

Alterar seu e-mail:

```bash
git config --global user.email "seu@email.com"
```

Ver todas as configurações:

```bash
git config --global --list
```

---

# 🌿 Branches

Branches permitem criar linhas diferentes de desenvolvimento.

Ver branches:

```bash
git branch
```

Criar uma branch:

```bash
git branch nome-da-branch
```

Trocar de branch:

```bash
git switch nome-da-branch
```

Criar e entrar em uma nova branch:

```bash
git switch -c nome-da-branch
```

---

# 🏷️ Versões

Versões importantes podem receber uma tag.

Criar uma versão:

```bash
git tag v1.0.0
```

Enviar a versão para o GitHub:

```bash
git push origin v1.0.0
```

Exemplo:

```text
v1.0.0 → Primeiro rice
v1.1.0 → Novo tema
v1.2.0 → Novos atalhos
v2.0.0 → Grande reformulação
```

---

# 🧰 Comandos úteis

A pasta `commands/` contém comandos úteis para Linux e aplicativos.

Cada página deve explicar:

* O que o comando faz
* Sintaxe
* Exemplos
* Quando usar
* Possíveis riscos
* Como desfazer, quando possível

---

# 📚 Documentação

A pasta `docs/` contém documentação mais detalhada sobre o projeto.

Exemplos:

```text
docs/
├── installation.md
├── customization.md
├── commands.md
├── shortcuts.md
└── troubleshooting.md
```

---

# 🔄 Scripts

A pasta `scripts/` terá ferramentas para facilitar o gerenciamento do projeto:

```text
scripts/
├── install/
├── update/
├── sync/
└── rollback/
```

A ideia é futuramente poder usar comandos simples como:

```bash
rice-update
rice-sync
rice-versions
rice-rollback
```

---

# 🖥️ Ambiente

**Sistema:** CachyOS

**Desktop:** Hyprland

**Shell:** F
