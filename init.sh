#Parar os container(s):
docker-compose down

#Deletar todos os containers:
docker rm -f $(docker ps -a -q)

#Deletar todos os volumes
docker volume rm $(docker volume ls -q)

#Reiniciar todos os containers:
docker-compose up -d

#Build do docker-compose
docker-compose build

# Executa o bundle install pela Primeira Vez
docker-compose run --rm app bundle install

#Para Entrar no bash do Service
#docker-compose run --service-ports app bash
