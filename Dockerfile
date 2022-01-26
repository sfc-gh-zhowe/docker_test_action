FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN pip install schemachange

COPY cli.py cli.py
COPY schemachange.sh schemachange.sh
RUN chmod u+x schemachange.sh
