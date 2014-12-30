#!/bin/bash

#if [[ "TRAVIS_PULL_REQUEST" == "false" ]] && [[ "TRAVIS_BRANCH" == "master" ]]; then

    pip install pydoctor

    REPO=`git config remote.origin.url`
    REV=`git rev-parse HEAD`

    git clone --branch gh-pages $REPO /tmp/tmp-docs

    pydoctor tubes

    rsync -rt --del --exclude=".git" apidocs /tmp/tmp-docs

    cd /tmp/tmp-docs

    git config user.name 'Tubes PyDoctor Builder'
    git config user.email 'tubes@twistedmatrix.com'

    git add -A

    git commit -m "Built from $(REV)"


#fi;
