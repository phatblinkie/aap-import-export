cd aap-config-export
podman run -it --rm --name aap-porter -v "$PWD":/mnt localhost/aap-porter:latest bash -c 'cd /mnt/ && ./export.cmdline.sh'
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

