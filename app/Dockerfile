# ---- deps ----
    FROM node:24-alpine AS deps
    WORKDIR /app
    RUN apk add --no-cache python3 make g++ libc6-compat
    RUN corepack enable && corepack prepare pnpm@9.5.0 --activate
    
    # copy monorepo
    COPY . .
    
    # install from lockfile
    RUN pnpm install --frozen-lockfile
    
    # minimal, NON-EMPTY build-time env so Next/Zod validation passes
    # real secrets are provided at runtime
    RUN printf "\
    DATABASE_URL=postgresql://postgres:postgres@localhost:5432/postgres\n\
    NEXTAUTH_SECRET=dev-secret\n\
    NEXTAUTH_URL=http://localhost:3000\n\
    SALT=dev-salt\n\
    CLICKHOUSE_URL=http://localhost:8123\n\
    CLICKHOUSE_USER=clickhouse\n\
    CLICKHOUSE_PASSWORD=clickhouse\n\
    REDIS_URL=redis://localhost:6379\n\
    ENCRYPTION_KEY=0000000000000000000000000000000000000000000000000000000000000000\n" > .env
    
    # ---- build ----
    FROM deps AS build
    WORKDIR /app
    RUN pnpm build
    
    # ---- runtime ----
    FROM node:24-alpine AS runner
    WORKDIR /app
    ENV NODE_ENV=production
    COPY --from=build /app ./
    EXPOSE 3000
    CMD ["/bin/sh","-c","pnpm start || pnpm --filter web start"]
    