#!/bin/bash

TMP="${HOME}/tmp"

if [[ $# -lt 2 ]]; then
    echo "$0 GODIR [GOBOOTSTRAP]+"
    echo "GODIR: the directory to copy."
    echo "GOBOOTSTRAP: one of the compilers we want to bootstrap from."
    exit
fi

for path in "$@"
do
    if [ ! -d "$path" ]; then
        echo "All paths need to be directories!"
        exit
    fi
done

godir="$1"

cpath="${TMP}/go"
i=0
for bootstrap in "${@:2}"
do
    path="${TMP}/go${i}"

    # Exit if paths exists.
    if [ -d "${path}" ]; then
        printf "Found \"${path}\", exiting.\n"
        exit
    elif [ -d "${cpath}" ]; then
        printf "Found \"${cpath}\", exiting.\n"
        exit
    fi
    cp -a "${godir}" "${cpath}"

    # Compile, remove unnecessary dirs and create hashfile.
    pushd "${cpath}/src" >/dev/null
    GOROOT_BOOTSTRAP="${bootstrap}" ./make.bash
    mv ${cpath} ${path}
    cd ${path}
    printf "Removing pkg/obj and pkg/bootstrap.\n"
    rm -rf "pkg/obj" "pkg/bootstrap"
    sha256sum `find -type f | sort` > "${TMP}/go${i}_hashes"

    popd >/dev/null
    i=$((i+1))
done
