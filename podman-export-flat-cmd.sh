cd aap-config-export
#doesnt work if selinux is enforcing, not sure why, disable for now
if [ $(getenforce) = "Enforcing" ]
then
	echo you must run this with selinux disabled sorry, type "sudo setenforce 0" and retry
	exit 1
fi
podman run -it --rm --name aap-porter -v "$PWD":/mnt localhost/aap-porter:latest bash -c 'cd /mnt/ && ./export.cmdline.flat.sh'
if [ -d ../flatexport ]
then
	rm -f ../flatexport.backup 
	echo "moving old flatexport dir to flatexport.backup"
	mv -fv ../flatexport ../flatexport.backup
	mv flatexport ../
else
        mv -fv flatexport ../
fi
echo "The exported files are in flatexport"
echo
echo
echo
echo "important! this does not export passwords in the files, you will need to edit some of them before importing"

