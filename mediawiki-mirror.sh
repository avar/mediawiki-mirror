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

        for url in git@github.com:mediawiki/$dir.git git@gitorious.org:mediawiki/$dir.git
        do
            if test $dir = "mediawiki-svn"
            then
                sudo -u mediawiki-mirror -s -H git push $url refs/remotes/*:refs/heads/*
            else
                sudo -u mediawiki-mirror -s -H git push $url master
            fi
        done
    )
done
