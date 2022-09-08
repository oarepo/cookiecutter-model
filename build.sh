#!/bin/bash

cd $(dirname $0)

yq -o=json cookiecutter.yaml >cookiecutter.json
