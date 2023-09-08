# Use an official Python runtime based on Ubuntu as a parent image
FROM ubuntu:20.04

# Set the working directory in the container to /app
WORKDIR /app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system packages and Python
RUN apt-get update \
    && apt-get install -y python3.8 python3-pip

# Install Jupyter Lab
RUN pip3 install jupyterlab

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Run pip check (this line is optional but can be useful)
RUN pip3 check

# Make port 8888 available to the world outside this container
EXPOSE 8080

# Run Jupyter Lab when the container launches
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8080", "--no-browser", "--allow-root"]

