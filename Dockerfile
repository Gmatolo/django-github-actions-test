#a lghtweight python env running on linux
FROM python:3.8-slim-buster

#optional cd into the /app directory of the container
WORKDIR /app
#copy the requirements.txt file in its own layer
COPY requirements.txt requirements.txt

#create the container environment
RUN pip3 install -r requirements.txt

#copy the source code
COPY . .

#command to be run to start the django app in the container
#0.0.0.0 exposes the container to the host machine on any ip
CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000"]