#!/bin/sh

CPATH=$(realpath $(dirname "$0"))

. "${CPATH}/config"

podman run ${RUNARGS} --hostname "${HOSTNAME}" --name "${NAME}" ${X11ARGS} ${FUSEARGS} ${SHAREDARGS} ${EXTRAARGS} "${TAGNAME}"
