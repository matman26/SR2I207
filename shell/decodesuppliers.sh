#!/bin/bash
function usage_statement {
    echo "Please supply a valid FILE argument" >&2
    echo "USAGE: $(basename ${0}) FILE"  >&2
    exit 1
}

if [[ "${#}" = 0 ]]
then
   usage_statement
fi

FILENAME="${1}"
if [[ -f "${FILENAME}" ]]
then
    echo "Reading from file ${FILENAME} "
    while IFS= read -r LINE
    do
	ID=$(echo "${LINE}" | awk -F ':' '{print $1}')
	ENCODED=$(echo "${LINE}" | awk -F ':' '{print $2}')
	DECODED=$(echo "${ENCODED}" | base64 -d)
	echo "${ID}:${DECODED}"
    done < "${FILENAME}"
else
    echo "File ${FILENAME} doesn't exist" >&2
    exit 1
fi
