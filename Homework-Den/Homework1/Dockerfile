ARG TAG=20
#ARG TAG-LAT=latest
#FROM node:${TAG-LAT}


# Set the working directory in the container
#WORKDIR /app

# Copy package.json and package-lock.json to the working directory
#COPY . .

# Install Node.js dependencies
#RUN npm install && \
#    echo "nodejs-app:${TAG}"
# Expose port 3000 to allow external access to the Node.js application
#EXPOSE 3000

# Command to run the Node.js application
#CMD ["node", "app.js"]



# Use an official Node.js runtime as a parent image

FROM node:${TAG}

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY . .

# Install Node.js dependencies
RUN npm install
# Expose port 3000 to allow external access to the Node.js application
EXPOSE 3000

# Command to run the Node.js application
CMD ["node", "app.js"]
