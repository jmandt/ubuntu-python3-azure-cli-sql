FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev curl \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip

RUN pip --no-cache-dir install pandas pypyodbc azure-cli==2.0.72
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update && ACCEPT_EULA=Y apt-get install msodbcsql17 -y

ENTRYPOINT ["/bin/bash"]