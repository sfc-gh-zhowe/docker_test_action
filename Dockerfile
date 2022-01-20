FROM ubuntu:latest

RUN mkdir -p /github/workspace

ENTRYPOINT ["/github/workspace/cli.sh"]
