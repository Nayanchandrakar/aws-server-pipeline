ARG VERSION=latest

FROM oven/bun:${VERSION} AS base

FROM base AS installer
WORKDIR /app
COPY . .
RUN bun install
RUN bun run build

FROM base AS runner
WORKDIR /app
COPY --from=installer /app/dist dist
COPY --from=installer /app/package.json package.json
COPY --from=installer /app/node_modules node_modules

EXPOSE 3000

CMD [ "bun" , "run" , "start" ]