# SETANDO A VERSÃO DO RUBY A SER UTILIZADA
FROM ruby:3.0.3

# INSTALANDO NOSSAS DEPDENDENCIAS
ENV NODE_VERSION 16
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends nodejs postgresql-client \
      locales yarn

# SETANDO A LOCALIZAÇÃO E FORMATO UTF-8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

# SETA A VARIAVEL DE AMBIENTE PARA O DIRETORIO DO PROJETO
ENV INSTALL_PATH /ninja_challenge

# SETA O DIRETORIO DA APLICACAÇÃO
RUN mkdir -p $INSTALL_PATH

# SETA O NOSSO PATH PARA O DIRETORIO PRINCIPAL
WORKDIR $INSTALL_PATH

# COPIA O GEMFILE PARA DENTRO DO CONTAINER
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

# INSTALA O BUNDLER E INSTALA AS GEMS
RUN gem install bundler
RUN bundle install

# SETA A PORTA DE EXECUÇÃO DA APLICACAÇÃO
EXPOSE 5000

COPY . $INSTALL_PATH