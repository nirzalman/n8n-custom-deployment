# Use a specific, stable n8n version
FROM n8nio/n8n:1.44.1

# Set environment variables for better npm/pnpm operation
ENV NPM_CONFIG_FUND=false
ENV NPM_CONFIG_AUDIT=false

# Set the working directory to n8n's app directory
WORKDIR /usr/local/n8n

# Switch to 'root' user temporarily for installation
USER root

# No need to install pnpm, it seems it's already there in the base image.
# RUN npm install -g pnpm  <--- REMOVE THIS LINE

# Install the custom node directly from GitHub using pnpm
RUN pnpm install https://github.com/idobe977/n8n-nodes-whatsapp-green-api.git#master

# After installation, switch back to the 'node' user that n8n runs as
USER node

# The base image already has an ENTRYPOINT defined, which will start n8n.
# Do NOT override CMD or ENTRYPOINT.