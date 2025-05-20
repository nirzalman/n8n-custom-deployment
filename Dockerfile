# Specify the base n8n image
FROM n8nio/n8n:latest

# Set the working directory inside the container
WORKDIR /usr/local/n8n

# The base image already has an ENTRYPOINT defined, which will start n8n.
# Do NOT override CMD or ENTRYPOINT.