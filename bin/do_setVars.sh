
function setVars {
	BN_CURRENTFOLDER=$(basename $PWD)
}

function getImage {

	if [ -e .dockerImage ] ; then
		DOCKER_IMAGE=$(eval echo $(cat .dockerImage ))
		return
	fi

	if [ -e Dockerfile ] ; then
		DOCKER_IMAGE=$(basename $PWD)
		return	
	fi

}

setVars
getImage

[ -n "${DOCKER_IMAGE}" ] && echo "Current image is ${DOCKER_IMAGE}"



