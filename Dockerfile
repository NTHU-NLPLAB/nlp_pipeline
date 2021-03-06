# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.8-slim

# Copy local code to the container image.
ENV APP_HOME /functions
WORKDIR $APP_HOME
COPY . ./

# Install production dependencies.
RUN pip install -f requirements

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec uvicorn parsing:app --host="0.0.0.0" --port="8080"