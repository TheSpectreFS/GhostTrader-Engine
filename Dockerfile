FROM node:20-alpine AS builder

WORKDIR /app
COPY package.json package-lock.json* ./
COPY packages/ packages/
RUN npm ci --workspace=packages/core --workspace=packages/sdk
RUN npm run build --workspace=packages/core --workspace=packages/sdk

FROM node:20-alpine

WORKDIR /app
COPY --from=builder /app/packages/core/dist packages/core/dist
COPY --from=builder /app/packages/sdk/dist packages/sdk/dist
COPY --from=builder /app/node_modules node_modules
COPY package.json ./

EXPOSE 8787

CMD ["node", "dist/server.js"]
