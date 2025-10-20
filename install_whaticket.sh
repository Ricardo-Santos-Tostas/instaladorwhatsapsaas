/bash
# =========================================
# Script de atualização e instalação Whaticket 2025
# Autor: Ricardo Santos Tosta
# =========================================

# Cores
VERDE="\033[1;32m"
AZUL="\033[1;34m"
RESET="\033[0m"

echo -e "${AZUL}--------------------------------------"
echo -e "🚀 INICIANDO PREPARAÇÃO DO SISTEMA"
echo -e "--------------------------------------${RESET}"

# Etapa 1: Atualização do sistema
echo -e "${VERDE}[1/6] Atualizando lista de pacotes...${RESET}"
apt-get update -y

echo -e "${VERDE}[2/6] Atualizando pacotes instalados...${RESET}"
apt-get upgrade -y
apt-get dist-upgrade -y

# Etapa 2: Instalação de dependências
echo -e "${VERDE}[3/6] Instalando pacotes essenciais (git, curl, net-tools, unrar)...${RESET}"
apt-get install -y git curl wget vim net-tools unrar htop unzip

# Etapa 3: Clonando repositório em /tmp
echo -e "${VERDE}[4/6] Clonando repositório do Whaticket 2025 em /tmp...${RESET}"
cd /tmp || exit
if [ -d "instaladorwhatsapsaas-main" ]; then
    echo -e "${AZUL}Repositório já existe em /tmp. Atualizando...${RESET}"
    cd instaladorwhatsapsaas-main && git pull
else
    git clone https://github.com/plwdesign/instaladorwhatsapsaas-main.git
    cd instaladorwhatsapsaas-main || exit
fi

# Etapa 4: Executando o instalador
echo -e "${AZUL}--------------------------------------"
echo -e "⚙️  EXECUTANDO INSTALAÇÃO DO WHATICKET"
echo -e "--------------------------------------${RESET}"

chmod +x install_instancia
./install_instancia

echo -e "${VERDE}✅ Instalação concluída com sucesso!${RESET}"

