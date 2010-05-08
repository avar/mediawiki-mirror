#!/bin/sh

# Update the pushmi mirror
pushmi sync ~git-svn-mirror/pushmi-svn-mirror/

# Update the mediawiki mirror from pushmi
cd /var/lib/mediawiki-mirror/mediawiki-svn
git svn fetch
git svn rebase

# Push all refs to GitHub
git push git@github.com:mediawiki/mediawiki-svn.git refs/remotes/*:refs/heads/*
