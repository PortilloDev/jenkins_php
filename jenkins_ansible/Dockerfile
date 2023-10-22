FROM jenkins/jenkins

USER root

RUN apt-get update -y

RUN apt-get install -y python3

RUN apt-get install -y python3-pip

# RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python3 get-pip.py

RUN pip3 install -U ansible

USER jenkins