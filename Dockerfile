# Stage 1: Builder
FROM node:18-alpine AS builder
WORKDIR /app
COPY . ./
# In a real app, we would copy package.json and run npm install here.

# Stage 2: Production
FROM node:18-alpine
WORKDIR /app
# Copy only the necessary artifacts from the builder stage
COPY --from=builder /app /app

# Run as a non-root user for enhanced security
USER node

EXPOSE 3000
# Update the CMD to your actual entrypoint if it is not index.js
CMD ["node", "index.js"]
