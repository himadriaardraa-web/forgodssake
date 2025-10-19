# Use official Node.js LTS image
FROM node:20-slim

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
COPY attendance-manager/package*.json attendance-manager/ 2>/dev/null || true
RUN npm ci --omit=dev || npm install

# Bundle app source
COPY . .

# Expose the port (Cloud Run uses PORT env)
EXPOSE 8080

# Use PORT env variable; Cloud Run will set it
ENV PORT 8080
CMD ["node", "server/app.js"]
