#!/bin/sh

CPATH=$(realpath $(dirname "$0"))

. "${CPATH}/config"

if [[ "$1" != "" ]]; then
    NAME="$1"
    #TAGNAME="ubuntu:$NAME"
    HOSTNAME=$NAME

    # create directories
    if [[ ! -d "${HOME}/.browser-${NAME}" ]]; then
        mkdir "${HOME}/.browser-${NAME}" "${HOME}/.browser-${NAME}/.cache" "${HOME}/.browser-${NAME}/.config" "${HOME}/.browser-${NAME}/.local" "${HOME}/.browser-${NAME}/.pki"
    fi

    if [[ ! -f "${HOME}/.browser-${NAME}/hosts" ]]; then
        cp /etc/hosts "${HOME}/.browser-${NAME}/hosts"
    fi

    EXTRAARGS="${EXTRAARGS} -v ${HOME}/.browser-${NAME}/.cache:${GUESTUSERHOME}/.cache:rw -v ${HOME}/.browser-${NAME}/.config:${GUESTUSERHOME}/.config:rw -v ${HOME}/.browser-${NAME}/.local:${GUESTUSERHOME}/.local:rw -v ${HOME}/.browser-${NAME}/.pki:${GUESTUSERHOME}/.pki:rw  -v ${HOME}/.browser-${NAME}/hosts:/etc/hosts:rw"
fi

podman run ${RUNARGS} --hostname "${HOSTNAME}" --name "${NAME}" ${X11ARGS} ${FUSEARGS} ${SHAREDARGS} ${EXTRAARGS} "${TAGNAME}"
