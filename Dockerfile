FROM ubuntu:latest

RUN mkdir -p ${GITHUB_WORKSPACE}

ENTRYPOINT ["${GITHUB_WORKSPACE}/cli.sh"]
