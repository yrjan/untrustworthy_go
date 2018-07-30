# Untrustworthy Go

## untrustworthy_go.path
This patch has only been tested on Linux systems, it is not known if it will work for any other system.

To implement this patch in a Go compiler download the Go source code, version 1.11beta1 or later. Go to the Go directory and run the following command:
`patch -p1 < PATH_TO_PATCH_FILE`

After this you can compile the Go compiler as usual by entering the *src* directory and running the file *make.bash*. Note that this requires an installed Go compiler on the system.

## golang_build_reproducibly.sh
Script to reproducibly compile the Go compiler on Linux for Diverse Double Compiling.

Usage:
`./golang_build_reproducibly.sh GODIR [GOBOOTSTRAP]+
GODIR: the directory to copy.
GOBOOTSTRAP: one of the compilers we want to bootstrap from.`

The first argument, *GODIR*, is a local Go directory we want to copy the source from. The second argument, *GOBOOTSTRAP* are all the different directories containg Go compilers we want to bootstrap the Go compiler from.

The script will create all the compilers needed to use in the *TMP* directory specified on *line 3* of the script. This directory will by default be set to: *${HOME}/tmp*.

## All files listings directory
These files are code listings for programs described in the thesis. If *go* is installed on the system they can be run with:
`go run FILENAME`.
