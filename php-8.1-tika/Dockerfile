FROM webdevops/php:8.1
RUN apt-install mariadb-client openjdk-11-jre-headless
RUN curl -so /usr/local/bin/tika-app.jar https://dlcdn.apache.org/tika/2.6.0/tika-app-2.6.0.jar
ENTRYPOINT ["/entrypoint"]
CMD ["supervisord"]
