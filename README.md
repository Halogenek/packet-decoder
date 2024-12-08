# packet-decoder
A tool for detecting and analyzing packets in captured embedded data streams.

## Creating the build environment

### For local development
1. Run `./configure.sh local`
2. Build with `./build.sh`

### For building using docker container
1. Build the docker image: `docker build . -t packet-decoder-build-env`
2. Run the docker image: `docker run --rm -v $(pwd):/app -it packet-decoder-build-env`\
   Where:
   1. `--rm` - remove container after the entry point is terminated
   2. `-v $(pwd):/app` - mount the repository in the container `/app` directory
   3. `-it` - attach to the container
3. Build with `./build.sh`