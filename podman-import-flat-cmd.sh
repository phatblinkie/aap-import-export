cd aap-config-import
#doesnt work if selinux is enforcing, not sure why, disable for now
if [ $(getenforce) = "Enforcing" ]
then
	echo you must run this with selinux disabled sorry, type "sudo setenforce 0" and retry
	exit 1
fi
podman run -it --rm --name aap-porter -v "$PWD":/mnt -v "$PWD/../flatexport":/mnt/flatexport localhost/aap-porter:latest bash -c 'cd /mnt/ && ./import.cmdline.flat.sh'

