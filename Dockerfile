FROM node:latest

WORKDIR /app

# Install nginx
RUN apt-get update && apt-get install -y nginx

# Copy app files
COPY . .

# Install Node.js dependencies
RUN npm install

# Expose port (optional)
EXPOSE 3000

# Command to start your app (example)
CMD ["node", "index.js"]