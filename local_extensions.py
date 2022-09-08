from cookiecutter.utils import simple_filter
import re


@simple_filter
def strip_model_builder(v):
    return re.sub('-?model-builder-?', '', v)
