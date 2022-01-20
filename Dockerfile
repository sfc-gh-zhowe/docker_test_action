FROM ubuntu:latest

RUN mkdir -p /github/workspace

ENTRYPOINT ["${GITHUB_WORKSPACE}/cli.sh"]
