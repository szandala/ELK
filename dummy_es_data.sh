#!/bin/bash -eu

DO_LECTURERS_EXISTS=$(curl -s -o /dev/null -w "%{http_code}" localhost:9200/lecturers/_search)

if [[ "${DO_LECTURERS_EXISTS}" -eq 200 ]]; then
    echo "lecturers index already exists, not feeding it"
else
set -x
    curl -XPOST -H 'Content-Type: application/json' \
        -d '{"name": "Tomasz", "surname": "Szandala", "last_login": "'"$(date -I -d '1 day ago')"'"}' \
        localhost:9200/lecturers/person

    curl -XPOST -H 'Content-Type: application/json' \
        -d '{"name": "Darren", "surname": "Master", "last_login": "'"$(date -I)"'"}' \
        localhost:9200/lecturers/person

    curl -XPOST -H 'Content-Type: application/json' \
        -d '{"name": "Nicole", "surname": "Superstar", "last_login": "'"$(date -I  -d '3 day ago')"'"}' \
        localhost:9200/lecturers/person

    sleep 2
    curl localhost:9200/lecturers/_search  | jq
fi


# just in case:
#curl -XDELETE http://localhost:9200/lecturers
