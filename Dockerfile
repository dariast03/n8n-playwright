
FROM mcr.microsoft.com/playwright:v1.58.0-noble

WORKDIR /app

RUN npm install -g n8n

RUN corepack enable

COPY package.json pnpm-lock.yaml ./

RUN pnpm install --frozen-lockfile

COPY . .

RUN pnpm run build

RUN mkdir -p /home/node/.n8n/custom/node_modules

# Entry point
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

ENTRYPOINT ["docker-entrypoint.sh"]
