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

        if test $dir = "mediawiki-svn"
        then
            git push git@github.com:mediawiki/$dir.git refs/remotes/*:refs/heads/*
        else
            git push git@github.com:mediawiki/$dir.git master        
        fi
    )
done
