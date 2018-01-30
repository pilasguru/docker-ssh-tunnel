#!/bin/sh

ssh-keygen -A

if [ "${PRIVATE_SSH_KEY}" != "**None**" ]; then
	echo "=> Found private key"

	# Create SSH files on container
	mkdir -p /root/.ssh
	chmod 700 /root/.ssh
	touch /root/.ssh/id_rsa
	chmod 600 /root/.ssh/id_rsa

	IFS=$'\n'
	arr=$(echo ${PRIVATE_SSH_KEY} | tr "," "\n")
	for x in $arr
	do
		x=$(echo $x | sed -e 's/^ *//' -e 's/ *$//')
		echo "$x" >> /root/.ssh/id_rsa
	done

	exec ssh -q -4 -oStrictHostKeyChecking=no -L 0.0.0.0:$TUNNELOPTS -N $TUNNELTO
else
	echo "ERROR: No private keys found in \$PRIVATE_SSH_KEY"
	exit 1
fi
