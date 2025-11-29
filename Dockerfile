FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y software-properties-common curl wget unzip && \
    apt clean

# Create a dummy index page to keep the container alive
RUN mkdir -p /app && echo "Mate Session Running..." > /app/index.html

WORKDIR /app

# Expose a fake web port to trick hosting platforms (Railway/Render)
EXPOSE 6080

# Keep container alive forever
CMD ["bash", "-c", "while true; do sleep 1; done"]
