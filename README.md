Imagem de um servidor FTP, utilizando o serviço [VSFTPD](https://security.appspot.com/vsftpd.html) que fornece suporte a TSL/SSL.

Imagem publicada no [Docker Hub](https://hub.docker.com/repository/docker/brgilsonsp/vsftp/general)

# Configurações

### Variáveis de ambiente
As seguintes configurações estão disponível para alteração durante a criação do container
* Variáveis de ambientes
  * FTP_USER
    * Usuário para acessar o FTP. Valor padrão: ***admin***
  * FTP_PASS
    * Senha do usuário para acessar o FTP. Valor padrão: ***admin***
  * PASV_ADDRESS
    * Endereço do host que irá servir o FTP. Valor padrão: ***127.0.0.1***


### Portas
Deve expor a porta para comunicação com o banco de dados Ms SQL Server
* 20-21/tcp
* 47400-47470/tcp


### Volume
Volumes que devem ser criados para exposição dos arquivos do servidor FTP:

  * Local aonde será armazenado os arquivos compartilhados no servidor FTP
    * /home/vsftpd
  * Local aonde será publicado os logs do servidor FTP
    * /var/log/vsftpd


# Como utilizar essa imagem

Utilizando a ultima versão:

`` docker run -d --volume <CAMNHO_NO_HOST>:/home/vsftpd --volume <CAMNHO_NO_HOST>:/home/vsftpd --publish 20-21:20-21 --publish 47400-47470:47400-47470 --env FTP_USER=adm --env FTP_PASS=adm123 --env PASV_ADDRESS=127.0.0.1 --name ftp brgilsons´/vsftp``

**Obs**: Não esqueça de observar os valores que devem ser alterados: **CAMNHO_NO_HOST** para o diretório que você deseja persistir os devidos arquivos

### Exemplo Dockerfile





