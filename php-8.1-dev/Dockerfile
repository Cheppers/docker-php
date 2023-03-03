FROM webdevops/php-dev:8.1
RUN apt-install mariadb-client
# Install nvm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v${nvmVersion}/install.sh | bash

RUN sed \
		--in-place \
		--expression='/If not running interactively/d' \
		--expression='/\[ -z "$PS1" \] && return/d' \
		--expression='/^export NVM_DIR/d' \
		--expression='/ This loads nvm/d' \
		~/.bashrc \
	&& echo 'test -s ~/.bashrc_nvm && . ~/.bashrc_nvm || true' >> ~/.bashrc \
	&& touch ~/.bashrc_nvm \
	&& echo 'export NVM_DIR="${HOME}/.nvm"' >> ~/.bashrc_nvm \
	&& echo 'test -s "${NVM_DIR}/nvm.sh" && . "${NVM_DIR}/nvm.sh" || true' >> ~/.bashrc_nvm \
	&& echo 'test -s "${NVM_DIR}/bash_completion" && . "${NVM_DIR}/bash_completion" || true' >> ~/.bashrc_nvm \
RUN echo 'test -s "${HOME}/.bashrc_nvm" && . "${HOME}/.bashrc_nvm" || true' >> ~/.bashrc

# Install node(s) and Yarn
RUN export NVM_DIR="${HOME}/.nvm" \
	&& . $HOME/.nvm/nvm.sh \
	&& nvm install 11.5.0 \
    && nvm install 12.16.1 \
    && nvm install 14.15.4 \
    && nvm install 16.16.0 \
    && nvm install 18.12.0 \
    && . ${HOME}/.bashrc_nvm \
    && nvm use --default 14.15.4 \
	&& npm install --global "yarn@1.15.2"

ENTRYPOINT ["/entrypoint"]
CMD ["supervisord"]
