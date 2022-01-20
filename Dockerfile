FROM ubuntu:latest

COPY SchemaChangeMock /SchemaChangeMock
ENTRYPOINT ["/SchemaChangeMock/cli.sh"]
