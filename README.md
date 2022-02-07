# docker-garage-s3
Petit test de faire tourner Garage S3 dans un docker

zf220207.1724




garage status

garage layout assign -z dc1 -c 1 <node_id>
garage layout assign -z dc1 -c 1 4bc5a996066b1b97

garage layout apply --version 1

garage bucket create 3sfs-zf

garage bucket list

garage bucket info 3sfs-zf

garage key new --name 3sfs-zf-app-key

garage key list

garage key info 3sfs-zf-app-key

garage bucket allow --read --write 3sfs-zf --key 3sfs-zf-app-key

garage bucket info 3sfs-zf


Sur la machine client:

mettre les secrest dans .passwd-s3fs-garage

s3fs 3sfs-zf ~/garage_s3 -o allow_other -o passwd_file=~/.passwd-s3fs-garage -o use_path_request_style -o endpoint=garage -o parallel_count=15 -o multipart_size=128 -o nocopyapi -o url=http://51.158.117.93:3900









https://garagehq.deuxfleurs.fr/documentation/quick-start/




https://garagehq.deuxfleurs.fr/documentation/cookbook/real-world/

docker exec -it garaged /garage status

alias garage='docker exec -it garaged /garage'

https://git.deuxfleurs.fr/Deuxfleurs/garage


s3fs 3sfs-zf ~/garage_s3 -o allow_other -o passwd_file=~/.passwd-s3fs-garage -o use_path_request_style -o endpoint=garage -o parallel_count=15 -o multipart_size=128 -o nocopyapi -o url=http://51.158.117.93:3900/






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


