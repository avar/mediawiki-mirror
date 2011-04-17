#!/bin/sh

# Exit on errors
trap 'fail' ERR
fail () {
    code=$?
    echo "Failed with exit code $code"
    exit 1
}

MIRROR=/var/lib/mediawiki-mirror
cd $MIRROR

# Update everything
for dir in *
do
    (
        cd $dir
        git svn fetch
        git svn rebase
    )
done
