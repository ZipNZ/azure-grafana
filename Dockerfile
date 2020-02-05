FROM grafana/grafana:6.6.0
USER root
COPY new-entry-point.sh /new-entry-point.sh
RUN chmod +x /new-entry-point.sh

USER grafana
ENTRYPOINT [ "/new-entry-point.sh" ]
CMD [ "/run.sh" ]