# Use a specific, stable n8n version
FROM n8nio/n8n:1.44.1

# Set environment variables for better npm/pnpm operation
ENV NPM_CONFIG_FUND=false
ENV NPM_CONFIG_AUDIT=false

# Set the working directory to n8n's app directory
WORKDIR /usr/local/n8n

# Switch to 'root' user temporarily for global installations if needed
USER root

# Install pnpm globally (required by the custom node)
RUN npm install -g pnpm

# Install the custom node directly from GitHub using pnpm
# This installs it locally into n8n's node_modules directory
# We explicitly install it with pnpm as required by the node's preinstall script.
RUN pnpm install https://github.com/idobe977/n8n-nodes-whatsapp-green-api.git#master

# After installation, switch back to the 'node' user that n8n runs as
USER node

# The base image already has an ENTRYPOINT defined, which will start n8n.
# Do NOT override CMD or ENTRYPOINT.