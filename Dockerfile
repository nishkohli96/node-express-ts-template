# === Base Image (Builder) ===
FROM node:22.14.0-alpine3.20 AS builder

# Set working directory
WORKDIR /app

# Copy package files first (for caching dependencies)
COPY --chown=node:node package.json tsconfig.json pnpm.lock ./

# Install dependencies
RUN npm i -g pnpm
RUN pnpm install --frozen-lockfile

# Copy the rest of the application code
COPY --chown=node:node . .

# Build TypeScript app
RUN pnpm build

# === Final Image (Production) ===
FROM node:22.14.0-alpine3.20 AS runner

# Set working directory
WORKDIR /app

# Copy built application & dependencies from builder stage
COPY --from=builder /app/package.json /app/pnpm.lock ./
COPY --from=builder /app/dist ./dist

RUN pnpm install --frozen-lockfile --production

# Expose the port (change if necessary)
EXPOSE 8000

# Start the application
CMD ["pnpm", "start"]
