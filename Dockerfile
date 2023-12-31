# set base image (host OS)
FROM python:3.8-slim-buster

# set the working directory in the container
WORKDIR /app

# copy the content of the local src directory to the working directory
COPY ./ .

RUN pip install uvicorn
RUN pip install gunicorn
RUN pip install "fastapi[all]"

EXPOSE 8000

# command to run on container start
ENTRYPOINT [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"] 