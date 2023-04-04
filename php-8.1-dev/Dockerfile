FROM webdevops/php-nginx-dev:8.1
RUN apt-install mariadb-client jq chromium

RUN mkdir -p \
		/var/log/nginx \
		/tmp/nginx/client_body \
		/tmp/nginx/fastcgi \
		/tmp/nginx/proxy \
		/tmp/nginx/scgi \
		/tmp/nginx/uwsgi \
  && \
  	rm -rf /etc/nginx/ \
  && \
  mkdir -p \
    /var/log/supervisor \
	&& \
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
	&& \
	unzip awscliv2.zip \
	&& \
	rm awscliv2.zip \
	&& \
	./aws/install

# Override the supervisor's configuration.
COPY assets/supervisor/supervisor.conf /opt/docker/etc/
# Add headless cromiuim's supervisor configuration to start.
COPY assets/supervisor/conf.d/ /opt/docker/etc/supervisor.d/
# Add our ngix config
COPY assets/nginx/ /etc/nginx/

ENTRYPOINT ["/entrypoint"]
COPY assets/docker-init.sh /bin/docker-init.sh
RUN chmod +x /bin/docker-init.sh
CMD ["docker-init.sh"]