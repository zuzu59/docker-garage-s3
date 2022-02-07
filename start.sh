#!/bin/bash
#Petit script pour démarrer tout le binz
#zf220207.1716

#pour installer Docker et Docker compose sur une machine Ubuntu c'est ici:
# https://github.com/zuzu59/deploy-proxmox/blob/master/install_docker.sh


docker-compose up -d
#docker-compose logs -f

echo -e "
Il faut faire l'alias:

alias garage='docker exec -it garaged /garage'

Puis suivre la procédure dans: 

https://garagehq.deuxfleurs.fr/documentation/quick-start/

"
