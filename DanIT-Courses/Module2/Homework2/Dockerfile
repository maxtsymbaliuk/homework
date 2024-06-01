FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP app.py

# Add a health check script
COPY healthcheck.sh /usr/src/app/healthcheck.sh

# Make the script executable
RUN chmod +x /usr/src/app/healthcheck.sh

# Define a health check for the container
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD /usr/src/app/healthcheck.sh

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0"]

