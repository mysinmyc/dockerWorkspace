#!/bin/bash



function addUsers {

	if [ -z "${ADDUSERS_NAMES}" ] ; then
		return
	fi 

	if [ -z "${ADDUSERS_PASSWORD}" ] ; then
		echo "ADDUSERS_PASSWORD not present, generating random password..."
		#ADDUSERS_PASSWORD=$(hostid)
		ADDUSERS_PASSWORD=$(uuidgen | cut -f 1 -d- )
	fi 

	vAdditionalParameters="-m"	
	if [ -n "${ADDUSERS_GROUPS}" ] ; then
		vAdditionalParameters="${vAdditionalParameters} -G ${ADDUSERS_GROUPS} "
	fi 

	echo "${ADDUSERS_NAMES}," | while read -d, vCurUser 
	do
		echo "[addUsers] Adding user ${vCurUser} with password [${ADDUSERS_PASSWORD}]..."
		useradd ${vAdditionalParameters}   ${vCurUser} 
		echo ${vCurUser}:$ADDUSERS_PASSWORD | chpasswd
	done
}



function reconfigureSsh {
	echo "[reconfigureSsh] Recreating SSH keys..."
	rm /etc/sshd/ssh_host* 
	/usr/sbin/sshd-keygen 
}



function oneTimeConfigurations {
	#Check for onetime activities
	vLockFile=/var/run/.containerConfigured
	if  [ -e $vLockFile ] && [ $(hostid) = $(cat $vLockFile) ] ; then
		return
	fi

	reconfigureSsh 2>/dev/null
	addUsers
 
	hostid > $vLockFile
}



function runSshD {

	echo "[runSshD] Starting sshd..."
	while /usr/sbin/sshd -E /var/log/sshd.log -D 
	do
		echo "[runSshD] sshd dead"
		sleep 5
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

execCustomInit

runSshD

