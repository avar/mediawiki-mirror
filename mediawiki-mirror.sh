#!/bin/sh

MIRROR=/var/lib/mediawiki-mirror

## Update the pushmi mirror
pushmi sync ~git-svn-mirror/pushmi-svn-mirror/

## Update the mediawiki mirror from pushmi

# Everything
cd $MIRROR/mediawiki-svn
git svn fetch
git svn rebase
git push git@github.com:mediawiki/mediawiki-svn.git refs/remotes/*:refs/heads/*

# Everything
cd $MIRROR/mediawiki-trunk-phase3
git svn fetch
git svn rebase
git push git@github.com:mediawiki/mediawiki-trunk-phase3.git refs/remotes/*:refs/heads/*
