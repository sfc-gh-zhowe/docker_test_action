FROM ubuntu:latest

COPY /schemachange/cli.sh  /cli.sh
ENTRYPOINT ["/cli.sh"]
