#FROM python:3.9-alpine
FROM centos:8
RUN yum install -y python3.9
RUN yum install -y which

COPY ./ /var
RUN cd /var
RUN pip3 install pipenv
WORKDIR /var
RUN pipenv install --system --ignore-pipfile

EXPOSE 8000
CMD uvicorn main:app --reload