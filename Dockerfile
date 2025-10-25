FROM n8nio/n8n:latest

USER root
# tiny tools (optional)
RUN apt-get update && apt-get install -y jq curl && rm -rf /var/lib/apt/lists/*

# copy workflows + entry
RUN mkdir -p /workflows /entry
COPY n8n/workflows /workflows
COPY docker-entrypoint.sh /entry/entry.sh
RUN chmod +x /entry/entry.sh

# n8n expects a user folder; we’ll use the Render disk at /data
ENV N8N_USER_FOLDER=/data

USER node
ENTRYPOINT ["/entry/entry.sh"]
