to build the image.
cd Dockerstuff
./build-image.sh

This will build the image as 'aap-porter:latest'


1. to run the exporter with the image
- edit the hosts in export-inventory.cfg
- edit the passwords or tokens in aap-export-flat.yml

-- execute podman-export-cmd.sh 

2. to run the importer with the image

