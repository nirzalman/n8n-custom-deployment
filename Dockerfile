# Use a specific, stable n8n version to avoid unexpected changes with 'latest'
FROM n8nio/n8n:1.44.1

# Set environment variables for better npm operation and potentially n8n
ENV NPM_CONFIG_FUND=false
ENV NPM_CONFIG_AUDIT=false

# Set the working directory inside the container
WORKDIR /usr/local/n8n

# Copy package.json and package-lock.json (if exists)
# The "." at the end of COPY means copy to the current WORKDIR
COPY package.json .
# If you ever run `npm install` locally and get a package-lock.json, uncomment the next line
# COPY package-lock.json .

# Install production dependencies (including custom nodes)
# We use npm ci for a clean install, it requires package-lock.json
# If you don't have package-lock.json, use 'npm install --omit=dev'
# Let's try with npm install first, it's more forgiving.
RUN npm install --omit=dev

# Ensure n8n is linked as an executable globally after custom node installation
# This addresses the "command n8n not found" error if npm install somehow breaks it
RUN npm link n8n

# The base image already has an ENTRYPOINT defined, which will start n8n.
# Do NOT override CMD or ENTRYPOINT unless you know exactly what you are doing.
# Our modifications are mainly for adding nodes, not changing how n8n starts.