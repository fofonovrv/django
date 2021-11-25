FROM python:3.9.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /project1
WORKDIR /project1
COPY requirements.txt /project1/
RUN pip install --upgrade pip && pip install -r requirements.txt
ADD . /project1/
