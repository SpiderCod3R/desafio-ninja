# Verifica e executa instalação de dependencias no app
bundle check || bundle install
# Executa nosso servidor
bundle exec rails s -p 5000 -b '0.0.0.0'