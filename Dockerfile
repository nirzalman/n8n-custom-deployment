# Use a specific, stable n8n version
FROM n8nio/n8n:1.44.1

# Set environment variables for better npm operation
ENV NPM_CONFIG_FUND=false
ENV NPM_CONFIG_AUDIT=false

# Set the working directory to n8n's app directory
# This is where n8n's main node_modules are located
WORKDIR /usr/local/n8n

# Switch to 'root' user temporarily to gain necessary permissions
# We need root to perform a proper npm install in certain scenarios or locations
USER root

# Install the custom node directly from GitHub
# We install it locally (without -g) into n8n's node_modules
# This will place it in /usr/local/n8n/node_modules
RUN npm install https://github.com/idobe977/n8n-nodes-whatsapp-green-api.git#master

# After installation, switch back to the 'node' user that n8n runs as
USER node

# The base image already has an ENTRYPOINT defined, which will start n8n.
# Do NOT override CMD or ENTRYPOINT.