# docker-garage-s3
Petit test de faire tourner Garage S3 dans un docker

zf220207.1830


## Buts
Le but de cette petite démo c'est de se fabriquer rapidement et facilement un petit serveur S3 avec Garage.


## Principes
Garage est un serveur S3 Storage Objet décentralisé qui peut tourner sur de vieux ordinateurs pour faire un serveur S3 personnel.

https://garagehq.deuxfleurs.fr/

Dans cette démo, nous n'utiliserons qu'un seul noeud, pour plusieurs noeuds, il faut simplement s'inspirer du fichier garage.toml.sample.3_node !


## Utilisation
### Installation
Comme cela fonctionne avec Docker, il faut installer en premier Docker sur sa machine !

Pour linux, on peut le faire très facilement ainsi:

```
curl -s -L https://raw.githubusercontent.com/zuzu59/deploy-proxmox/master/install_docker.sh | bash -s --
```

Pour les autres platteformes, il faut lire la documentation d'installation de Docker.

Après il faut récupérer ce dépôt avec:
```
cd ~/
git clone https://github.com/zuzu59/docker-garage-s3.git
cd docker-garage-s3
```


### Configuration de garage
Il faut copier le fichier garage.toml.sample.one_node dans garage.toml avec la commande:
```
cp garage.toml.sample.one_node garage.toml
```
Puis le modifier en conséquence celon le quick start:

https://garagehq.deuxfleurs.fr/documentation/quick-start/


### Démarrage
Pour le démarrer il faut simplement faire ceci:
```
./start.sh
```

Et après quand cela à terminé de démarrer, il faut configurer notre server avec tout ce binz (https://garagehq.deuxfleurs.fr/documentation/quick-start/):

En premier on regarde s'il tourne bien:
```
garage status
```

On assigne un *layout* en remplaçant <node_id> par les 6 premiers caractères du node ID avec:
```
garage layout assign -z dc1 -c 10 <node_id>
```
Ici on a mis 10GB de storage !

On applique le layout avec:
```
garage layout apply --version 1
```

On crée un bucket avec (mon bucket se nomme ici 3sfs-zf):
```
garage bucket create 3sfs-zf
```

On regarde si c'est bon avec:
```
garage bucket list
garage bucket info 3sfs-zf
```

On crée une *app key* avec:
```
garage key new --name 3sfs-zf-app-key
```

On vérifie la *key* avec:
```
garage key list
garage key info 3sfs-zf-app-key
```

On configure les autorisations sur notre bucket avec:
```
garage bucket allow --read --write 3sfs-zf --key 3sfs-zf-app-key
```

On vérifie avec:
```
garage bucket info 3sfs-zf
```

Ouf, voilà, notre serveur S3 est opérationnel !


### Utilisation de notre serveur S3
Le plus simple pour tester notre nouveau serveur S3 est de le monter sur une machine Linux en tant que disque système avec *s3fs* !


On installe s3fs sur sa machine client (donc pas sur notre serveur S3 !
```
sudo apt update
sudo apt upgrade
sudo apt install s3fs
```

Il faudra encore autoriser l'utilisation de *s3fs* par des *users non sudo* en décommentant:
```
user_allow_other
```
avec:
```
sudo nano /etc/fuse.conf
```


On met l'*api key* de notre serveur S3 dans le fichier ~/.passwd-s3fs-garage avec un truc du style:
```
echo GKa5e0daa0c9a5153978d5d6ec:c8a0714b4e3436ffd77c476efdc67169a1d77e1471080ae00a91d4f53c1d4612 > ~/.passwd-s3fs-garage
chmod 600 ~/.passwd-s3fs-garage
```
Bien entendu en mettant ça *key* et son *secret* à gauche et à droite des ':' !


On crée le point de montage avec:
```
mkdir ~/garage_s3
```

Et enfin on monte notre serveur S3 avec:
```
s3fs 3sfs-zf ~/garage_s3 -o allow_other -o passwd_file=~/.passwd-s3fs-garage -o use_path_request_style -o endpoint=garage -o parallel_count=15 -o multipart_size=128 -o nocopyapi -o url=http://51.158.117.93:3900
```
En mettant l'adresse IP publique que nous avions mis dans le fichier garage.toml !


### Arrêt
Pour l'arrêter, simplement:
```
./stop.sh
```

### Pour tout effacer !
Attention, ça efface vraiment toute la parite Docker sur la machine, donc attention s'il y a des autres utilisations de Docker !
```
./stop.sh
./purge.sh
sudo rm -rf data/ meta/
```


## Sources

https://garagehq.deuxfleurs.fr/documentation/quick-start/

https://garagehq.deuxfleurs.fr/documentation/cookbook/real-world/

docker exec -it garaged /garage status

alias garage='docker exec -it garaged /garage'

https://git.deuxfleurs.fr/Deuxfleurs/garage

https://hub.docker.com/r/dxflrs/amd64_garage





## History de création du projet

zhisto
-----
alias garage='docker exec -it garaged /garage'
garage
garage status
nano README.md
garage layout show
garage layout apply
garage layout show
garage node id
garage status
garage layout apply
garage layout show
garage layout apply
garage layout apply --version 1
nano garage.toml
./stop.sh
./start.sh
garage layout show
garage layout apply
garage layout apply --version 1
cp garage.toml garage.toml.sav.220207.1515
gst
nano .gitignore
gst
nano garage.toml
./stop.sh
sudo rm -rf meta/ data/
./start.sh
garage status
garage layout assign -z dc1 -c 10 079e669328d3d810
garage layout show
garage layout apply
garage layout apply --version 1
nano README.md
gst
nano garage.toml.sample
mv garage.toml.sample garage.toml.sample.one_node
cp garage.toml.sample.one_node garage.toml.sample.3_node
nano garage.toml.sample.3_node
gst
gad
gcm
gps
garage status
garage bucket create 3sfs-zf
garage bucket list
garage bucket info 3sfs-zf
garage key new --name 3sfs-zf-app-key
garage key list
garage key info nextcloud-app-key
garage key info 3sfs-zf-app-key
garage bucket allow --read --write 3sfs-zf --key 3sfs-zf-app-key
garage bucket info 3sfs-zf
nano README.md
zhisto
alias
alias zhisto='history |tail -n 100 | sed '\''s/^[0-9 ]*//'\'''


