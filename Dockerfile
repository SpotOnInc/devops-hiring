# syntax=docker/dockerfile:1
FROM python:3.9.10
# Sets an environmental variable that ensures output from python is sent straight to the terminal without buffering it first
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
# Sets the container's working directory to /code
WORKDIR /code
# Copies all files from our local project into the container
ADD . /code
# runs the pip install command for all packages listed in the requirements.txt file
RUN pip install -r requirements.txt

ENTRYPOINT ["python", "/code/manage.py", "runserver", "0.0.0.0:8080"]
