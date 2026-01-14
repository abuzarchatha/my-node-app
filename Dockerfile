# syntax = docker/dockerfile:1

#########################
#   BUILD STAGE
#########################
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY src/ ./src/

#########################
#   RUNTIME STAGE
#########################
FROM node:18-alpine AS runtime
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/src ./src
RUN chown -R node:node /app
USER node
EXPOSE 8080

# NOTE: removed HEALTHCHECK that used wget (wget is not installed in the image).
# Platforms (App Runner / ECS / etc.) provide their own health checks. If you want
# an in-image healthcheck, install a tiny tool or implement a node-based check.

ARG BUILD_SHA=unknown
LABEL com.mycompany.build.sha=$BUILD_SHA

CMD ["node", "src/index.js"]
