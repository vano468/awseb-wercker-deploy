FROM python:slim
MAINTAINER Ivan Kornilov <vano468@gmail.com>

RUN pip install --upgrade awscli awsebcli

RUN apt-get update
RUN apt-get install -y git && \
		apt-get clean

ADD scripts /opt
