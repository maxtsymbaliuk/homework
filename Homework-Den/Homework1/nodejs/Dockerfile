ARG NODE_VERSION
FROM node:${NODE_VERSION}

LABEL app="nodejs-app" version="${NODE_VERSION}"
ARG PORT
ENV PORT=${PORT}
EXPOSE ${PORT}

# Create a non-root user

#RUN groupadd -r node && useradd -r -g node node

# Set app directory permissions
WORKDIR /app

# Change ownership of the application directory to the non-root user 'node'
RUN chown -R node:node /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 3000 to allow external access to the Node.js application
EXPOSE 3000

# Use the non-root user to run your application
USER node

# Command to run the Node.js application
CMD ["node", "app.js"]

