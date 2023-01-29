FROM ubuntu:22.04

LABEL version="1.0"
LABEL author="Gilson Souza"
LABEL vendor="Winix"
LABEL service="Servidor FTP com suporte a SSL/TLS"
LABEL vendor_image_base="https://hub.docker.com/_/ubuntu"
LABEL operation_system="Ubuntu Jammy 22.04"

RUN apt-get update && \
		apt-get install -y --no-install-recommends vsftpd db-util && \
		apt-get clean

ENV FTP_USER admin
ENV FTP_PASS admin
ENV PASV_ADDRESS 127.0.0.1

EXPOSE 20-21/tcp
EXPOSE 47400-47470/tcp

COPY vsftpd.conf /etc/vsftpd/
COPY vsftpd_virtual /etc/pam.d/
COPY run-vsftpd.sh /usr/sbin/

RUN chmod +x /usr/sbin/run-vsftpd.sh
RUN mkdir -p /var/run/vsftpd/empty

VOLUME /home/vsftpd
VOLUME /var/log/vsftpd

CMD ["/usr/sbin/run-vsftpd.sh"]
