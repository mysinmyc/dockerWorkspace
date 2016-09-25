#!/bin/bash



function addUsers {

	if [ -z "${ADDUSERS_IDS}" ] ; then
		return
	fi 

	if [ -z "${ADDUSERS_PASSWORD}" ] ; then
		ADDUSERS_PASSWORD=$(hostid)
	fi 

	vAdditionalParameters="-m"	
	if [ -n "${ADDUSERS_GROUPS}" ] ; then
		vAdditionalParameters="${vAdditionalParameters} -G ${ADDUSERS_GROUPS} "
	fi 

	echo "${ADDUSERS_IDS}," | while read -d, vCurUser 
	do
		echo "[addUsers] Adding user ${vCurUser} with password ${ADDUSERS_PASSWORD}..."
		useradd ${vAdditionalParameters}   ${vCurUser} 
		echo ${vCurUser}:$ADDUSERS_PASSWORD | chpasswd
	done
}



function reconfigureSsh {
	echo "Recreating SSH keys..."
	rm /etc/sshd/ssh_host*
	dpkg-reconfigure openssh-server
}



function oneTimeConfigurations {
	#Check for onetime activities
	vLockFile=/var/run/.containerConfigured
	if  [ -e $vLockFile ] && [ $(hostid) = $(cat $vLockFile) ] ; then
		return
	fi

	reconfigureSsh
	addUsers
 
	hostid > $vLockFile
}



function startSshD {

	echo "[startSshD] Starting sshd..."
	/etc/init.d/ssh start

}



function waitForSshD {

	echo "[wasForSshD] Waiting for sshd..."

	vPID=$( cat /var/run/sshd.pid )
	while kill -0 $vPID
	do
		sleep 60
	done

}



function execCustomInit {

	vInitFolder=/etc/container.d

	if [ ! -d ${vInitFolder} ] ; then
		echo "[execCustomInit] missing folder ${vInitFolder}..."	
		return
	fi
	echo "[execCustomInit] Executing from ${vInitFolder}..."	
	for vCurFile in $( ls ${vInitFolder} | sort )
	do
		echo "[execCustomInit] found ${vCurFile}"
		
		echo -e "[execCustomInit]\t starting ${vCurFile} ..."
		if [ -x "${vInitFolder}/${vCurFile}" ] ; then
			"${vInitFolder}/${vCurFile}"
		else 
			bash "${vInitFolder}/${vCurFile}"
		fi	
		echo -e "[execCustomInit]\t ${vCurFile} ended with RC: $?"
	done
	
}

oneTimeConfigurations

startSshD
execCustomInit
waitForSshD



