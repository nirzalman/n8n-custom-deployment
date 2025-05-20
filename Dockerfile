# Specify the base n8n image
# Use 'latest' for the most recent version, or a specific version like 1.44.1 for stability.
# Let's stick to 'latest' for now to ensure we get any recent fixes unless issues arise.
FROM n8nio/n8n:latest

# Set the working directory inside the container (this is usually already done by n8n image, but good practice)
WORKDIR /usr/local/n8n

# No need for custom npm install or package.json copying here
# The custom node will be loaded via NODE_EXTRA_PACKAGES environment variable

# EXPOSE is usually handled by the base image
# CMD is usually handled by the base image's ENTRYPOINT

# The base image already has an ENTRYPOINT defined, which will start n8n.
# Our custom node will be loaded via environment variables.