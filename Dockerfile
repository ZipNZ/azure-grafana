FROM grafana/grafana:6.3.5
USER root
COPY new-entry-point.sh /new-entry-point.sh
RUN chmod +x /new-entry-point.sh

# See https://docs.microsoft.com/en-gb/azure/app-service/containers/configure-custom-container#enable-ssh
RUN apt-get update && \
        apt-get install openssh-server -y && \
        apt-get autoremove -y && \
        rm -rf /var/lib/apt/lists/* && \
        echo "root:Docker!" | chpasswd 

COPY sshd_config /etc/ssh/
EXPOSE 3000 2222

ENTRYPOINT [ "/new-entry-point.sh" ]
CMD [ "/run.sh" ]