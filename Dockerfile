FROM ruby:3.0.3

# INSTALANDO O NODE E O YARN
ENV NODE_VERSION=16
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# INSTALANDO AS NOSSAS DEPENDENDCIAS
RUN apt update -qq
RUN apt install -y --no-install-recommends nodejs libpq-dev locales yarn

# SETANDO A LOCALIZAÇÃO
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

# SETA A VARIAVEL DE AMBIENTE PARA O DIRETORIO DO PROJETO
ENV INSTALL_PATH /DESAFIO-NINJA

# SETA O DIRETORIO DA APLICACAÇÃO
RUN mkdir -p $INSTALL_PATH

# SETA O NOSSO PATH PARA O DIRETORIO PRINCIPAL
WORKDIR $INSTALL_PATH

# COPIA O GEMFILE PARA DENTRO DO CONTAINER
COPY Gemfile ./

# SETA O PATH PARA O BUNDLE
ENV BUNDLE_PATH /box

RUN gem install bundler
RUN bundle install

# SETA A PORTA DE EXECUÇÃO DA APLICACAÇÃO
EXPOSE 5000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]

COPY . .

