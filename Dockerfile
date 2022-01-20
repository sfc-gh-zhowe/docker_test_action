FROM ubuntu:latest

RUN mkdir /schemachange

ENTRYPOINT ["/schemachange/cli.sh"]
