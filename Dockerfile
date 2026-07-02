# -----------------------------------------------------------------------------
# Secure Node Lab
# Dockerfile
#
# This container provides a lightweight environment for running the Secure
# Node Lab application using Node.js and Express.
#
# Security considerations:
# - Official Node.js Alpine image
# - Non-root user
# - Optimized Docker layer caching
# - Production-ready container layout
# -----------------------------------------------------------------------------

FROM node:20-alpine

LABEL maintainer="Roberto Delgado"
LABEL project="Secure Node Lab"
LABEL description="Educational Node.js application demonstrating secure coding and DevSecOps practices."

# -----------------------------------------------------------------------------
# Set working directory
# -----------------------------------------------------------------------------

WORKDIR /app

# -----------------------------------------------------------------------------
# Copy dependency files first to leverage Docker cache
# -----------------------------------------------------------------------------

COPY package*.json ./

# -----------------------------------------------------------------------------
# Install dependencies
# -----------------------------------------------------------------------------

RUN npm ci

# -----------------------------------------------------------------------------
# Copy application source code
# -----------------------------------------------------------------------------

COPY . .

# -----------------------------------------------------------------------------
# Use non-root user provided by the Node image
# -----------------------------------------------------------------------------

USER node

# -----------------------------------------------------------------------------
# Expose application port
# -----------------------------------------------------------------------------

EXPOSE 3000

# -----------------------------------------------------------------------------
# Start application
# -----------------------------------------------------------------------------

CMD ["node", "app.js"]
