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

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget -qO- http://localhost:8080/health || exit 1

ARG BUILD_SHA=unknown
LABEL com.mycompany.build.sha=$BUILD_SHA

CMD ["node", "src/index.js"]
