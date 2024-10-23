# Verificando e instalando atualizações
apt update && upgrade -y

# Instalando dependencias
apt install docker.io curl git zip ftp -y

#Baixando docker-compose
curl -L "https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#Criando diretório padrão para instalação
mkdir /home/horus

#Baixando repositorio do Github
git clone https://github.com/alexwendergithub/compose.git /home/horus/

#Entrando na pasta da aplicação
cd /home/horus/

#Declaração de variáveis do FTP

FTP_SERVER="159.112.183.190"
FTP_USER="horus"
FTP_PASS="0lh4tud0!"
REMOTE_FILE="volumes.zip"

# Conectando ao servidor FTP e baixando o arquivo
ftp -inv $FTP_SERVER <<EOF
user $FTP_USER $FTP_PASS
get $REMOTE_FILE
bye
EOF

#Dezipando arquivo
unzip volumes.zip

# Mudando permissões do diretório Grafana
chmod 777 -R Grafana/

#Baixando imagens e subindo imagem do arquivo docker-compose
docker-compose up -d
