#!/bin/bash

set -e

setUp() {
    if [[ `pwd` == *test_repo ]]; then
        cd ..
    fi

    if [[ -e test_repo ]]; then
        rm -rf test_repo
    fi

    mkdir test_repo
    cd test_repo
    touch .gitignore
    git init > /dev/null
    cp ../../hooks/* .git/hooks
    chmod +x .git/hooks/*
}

suite() {
    for test_name in `grep '^it_' $0 | cut -d '(' -f 1`; do
        suite_addTest $test_name
    done
}

. shunit2-2.1.6/src/shunit2
