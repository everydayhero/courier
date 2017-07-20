FROM docker.elastic.co/logstash/logstash:5.5.0

ENV LOG_GROUP_PREFIX="logstash-"

EXPOSE 9600

ADD plugins /usr/share/logstash/plugins
RUN /usr/share/logstash/bin/logstash-plugin uninstall x-pack && \
  /usr/share/logstash/bin/logstash-plugin install logstash-output-logentries
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/
