import os

project_path = os.getcwd()
expansions = {
    "files.yaml": '{{ cookiecutter.use_files }}',
    "requests.yaml": '{{ cookiecutter.use_requests }}',
    "expandable_fields.yaml": '{{ cookiecutter.use_expandable_fields}}'
              }
for expansion_file, expansion_allowed in expansions.items():
    path = f"{project_path}/{expansion_file}"
    if not expansion_allowed == "yes" and os.path.exists(path):
        os.remove(path)


