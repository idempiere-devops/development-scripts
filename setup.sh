#!/bin/bash

set -e

clean=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --clean)
      clean=true
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
  shift
done

if [ ${clean} = true ]; then
    docker rm -f postgres-idempiere
    exit 0
fi

docker run --name postgres-idempiere -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres:15