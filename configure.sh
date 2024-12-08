#! /bin/bash

if [ "$1" == "local" ]; then # If the build env will be local then set up a python venv for conan
    python -m venv ./.venv
    source ./.venv/bin/activate
    pip install conan
    conan install . -pr=./conan/profiles/default --profile:build=./conan/profiles/default --output-folder=build --build=missing
elif [ "$1" == "docker" ]; then # If we are running from the container
    conan install . -pr=./conan/profiles/default --profile:build=./conan/profiles/default --output-folder=build --build=missing
    /bin/bash # Return a shell in the docker env
else
    echo "Use $0 local for configuring local env"
    echo "Use $0 docker for configuring env inside a docker container"
fi

