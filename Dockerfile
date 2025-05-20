# Specify the base n8n image
FROM n8nio/n8n:latest

# Set the working directory inside the container
WORKDIR /usr/local/n8n

# Install custom community nodes (replace with your actual node names)
# You can add multiple lines for different nodes
# For example, if you want to install 'n8n-nodes-base' and 'n8n-nodes-google-sheets'
# Use 'npm install <package-name>'
#
# Example:
RUN npm install n8n-nodes-whatsapp-green-api@latest

# You might need to rebuild n8n's dependencies if you install many nodes
# RUN npm rebuild

# Expose the port n8n runs on
EXPOSE 5678

# Command to run n8n when the container starts
CMD ["n8n", "start"]