# Specify the base n8n image
# We use a specific version for better stability and to allow copying files into it
FROM n8nio/n8n:1.44.1

# Set the working directory inside the container
WORKDIR /usr/local/n8n

# Copy package.json and package-lock.json (if exists)
# The "." at the end of COPY means copy to the current WORKDIR
COPY package.json .
# If you ever run `npm install` locally and get a package-lock.json, uncomment the next line
# COPY package-lock.json .

# Install production dependencies (including custom nodes)
# This command uses the node_modules from the base image and adds ours.
# We use npm ci for clean install, but npm install should also work.
RUN npm install --omit=dev

# It's good practice to ensure n8n's executable is globally available
# by linking it or adding its bin directory to PATH.
# However, the base n8n image usually handles this.
# The issue might be that a previous `npm install` messed up the PATH.
# Let's ensure n8n's CLI is linked.
# (Optional, but can help if the command is not found)
RUN npm link n8n

# No need for EXPOSE and CMD as the base image usually defines an ENTRYPOINT
# that handles starting n8n. If we override it, we can break things.
# We remove these lines.
# EXPOSE 5678
# CMD ["n8n", "start"]

# The base image already has an ENTRYPOINT defined, which will start n8n.
# Our modifications are mainly for adding nodes, not changing how n8n starts.