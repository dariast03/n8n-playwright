
#!/bin/sh
set -e

echo "Registering Playwright node..."

mkdir -p /home/node/.n8n/custom/node_modules

rm -rf /home/node/.n8n/custom/node_modules/n8n-nodes-playwright-automation

ln -s /app /home/node/.n8n/custom/node_modules/n8n-nodes-playwright-automation

export N8N_CUSTOM_EXTENSIONS=/home/node/.n8n/custom/node_modules

echo "Starting n8n..."

exec n8n start
