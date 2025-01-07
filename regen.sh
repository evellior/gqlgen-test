#!/bin/bash

limit=1000

if [[ $# -eq 1 ]]; then
    inf=false
    limit=$1
fi

for (( i = 0; i < limit; i++ )); do
    echo generating... 
    go run github.com/99designs/gqlgen 
    if [ -n "$(git status --porcelain)" ]; then 
        echo "::error::The generated graphql resolvers do not match with those in the branch!"
        git status -v -v
    else
        echo no changes
    fi
done
