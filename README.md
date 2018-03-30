# Docker Compose para subir o APM Java Glowroot

Para subir o ambiente execute "docker-composer up" neste diretório.

Este projeto sobe um container com o banco Cassandra, utilizado pelo Glowroot, cria uma nova imagem com Glowroot instalado e sobe um container dessa nova imagem, linkando-o com o container do Cassandra.

Edite o volume para persistir os dados do Cassandra no arquivo docker-compose.yml.

Após subir o ambiente, para acessar o Glowroot: https://endereço:4000

## Documentações:

https://hub.docker.com/_/cassandra/

https://github.com/glowroot/glowroot/wiki/Central-Collector-Installation

## Caso queira consultar status do Cassandra

docker exec -it cassandra bash

nodetool status

## Caso queira consultar logs do Glowroot

docker logs nome_container_glowroot

## Configuração do agente nos servidores de aplicação:

vi /dir_do_agente/glowroot.properties:

agent.id=Cluster Name::server_name

collector.address=http://IP_Server_Glowroot:8181

### Caso queira utilizar o seu certifivado válido (https):
Pública: nome.crt

Privada: openssl pkcs8 -topk8 -in your_private.key -out ui-key.pem -nocrypt

