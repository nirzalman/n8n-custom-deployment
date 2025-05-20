# Specify the base n8n image
FROM n8nio/n8n:latest

# Set the working directory inside the container
WORKDIR /usr/local/n8n

# Copy package.json and package-lock.json (if exists) to the working directory
COPY package.json .
# If you ever run `npm install` locally and get a package-lock.json, uncomment the next line
# COPY package-lock.json .

# Install production dependencies (including custom nodes)
# The --omit=dev flag ensures only production dependencies are installed
RUN npm install --omit=dev

# Expose the port n8n runs on
EXPOSE 5678

# Command to run n8n when the container starts
CMD ["n8n", "start"]