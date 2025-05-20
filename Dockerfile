# Use a specific, stable n8n version to avoid unexpected changes with 'latest'
FROM n8nio/n8n:1.44.1

# Set environment variables for better npm operation and potentially n8n
ENV NPM_CONFIG_FUND=false
ENV NPM_CONFIG_AUDIT=false

# Set the working directory inside the container
WORKDIR /usr/local/n8n

# *** NEW APPROACH: Install custom node directly from GitHub ***
# This requires Git to be available in the image, which it usually is.
# Replace 'idobe977/n8n-nodes-whatsapp-green-api' with the actual GitHub user/repo.
# We explicitly install it globally so n8n can find it.
# n8n uses 'npm install -g <package>' for its custom nodes
# Let's verify the actual node name and path: n8n-nodes-whatsapp-green-api
RUN npm install -g https://github.com/idobe977/n8n-nodes-whatsapp-green-api.git#master

# Ensure n8n is linked as an executable globally after custom node installation
# This addresses the "command n8n not found" error if npm install somehow breaks it
RUN npm link n8n

# The base image already has an ENTRYPOINT defined, which will start n8n.
# Do NOT override CMD or ENTRYPOINT unless you know exactly what you are doing.
# Our modifications are mainly for adding nodes, not changing how n8n starts.