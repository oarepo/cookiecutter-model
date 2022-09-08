#!/bin/bash

set -e

cd "$(dirname $0)"

# prepare virtualenv

MB_VENV=.venv-model-builder
MB_BIN=${MB_VENV}/bin
MB_PIP=${MB_BIN}/pip

if [ ! -d ${MB_VENV} ] ; then
  python3.10 -m venv ${MB_VENV}

  ${MB_PIP} install -U pip
  ${MB_PIP} install -U setuptools wheel

  # install model builder main package
  ${MB_PIP} install 'oarepo-model-builder>=1.0.0dev29'

  # install required plugins
  {% if cookiecutter.base_model_package != '(none)' %}
  ${MB_PIP} install -U --pre {{ cookiecutter.base_model_package }} \
                       nr-vocabularies-model-builder \
                       'oarepo-vocabularies-model-builder>=0.0.8' \
                       oarepo-model-builder-multilingual
  {% endif %}
fi

${MB_BIN}/oarepo-compile-model -vvv model_app.yaml --output-directory {{ cookiecutter.model_name }}
 # --save-model model_included.yaml

cp {{cookiecutter.model_name}}/{{cookiecutter.model_package}}/models/inherited_model.json \
   {{cookiecutter.model_name}}-model-builder/{{cookiecutter.model_package}}_model_builder/models/model.json
