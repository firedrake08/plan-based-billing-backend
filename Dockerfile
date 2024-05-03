# Use a slim Node.js base image
FROM node:lts-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy your application code
COPY . .

# Expose port where your Express app listens
EXPOSE 8080
# You can change this to your app's port

# Command to start your application
CMD [ "npm", "start" ]

# Optional: Build stage for multi-stage builds (comment out if not needed)
# LABEL build-stage=builder

# Optional: Production stage with a smaller image (comment out if not needed)
# FROM node:lts-alpine AS runner
# WORKDIR /usr/src/app
# COPY --from=builder /usr/src/app/node_modules ./node_modules
# COPY --from=builder /usr/src/app .
# EXPOSE 3000
# CMD [ "npm", "start" ]
