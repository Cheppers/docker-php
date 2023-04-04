FROM ghcr.io/cheppers/docker-php:8.1-dev

ARG NODE_VERSION
ARG YARN_VERSION

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.3/install.sh | bash

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
  && nvm install $NODE_VERSION \
  && . ${HOME}/.bashrc_nvm \
  && nvm use $NODE_VERSION \
  && nvm use --default $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
	&& npm install --global "yarn@$YARN_VERSION"