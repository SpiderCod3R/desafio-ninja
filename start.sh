# Verifica e executa instalação de dependencias no app
bundle check || bundle install

# Remove se houver server.pid e Executa nosso servidor
rm -f tmp/pids/server.pid && bundle exec rails s -p 5000 -b '0.0.0.0'