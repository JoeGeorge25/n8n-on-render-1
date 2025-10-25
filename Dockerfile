# Minimal + stable n8n image (no custom entrypoint needed)
FROM n8nio/n8n:latest

# Expose editor
EXPOSE 5678
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_HOST=0.0.0.0

# Start n8n
CMD ["n8n", "start"]
