FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y \
    tmate \
    openssh-client \
    sudo \
    curl \
    wget \
    git \
    netcat && \
    apt clean

# Fake Web Port (Railway needs this)
EXPOSE 8080

# Start script
RUN echo '#!/bin/bash\n\
tmate -S /tmp/tmate.sock new-session -d\n\
tmate -S /tmp/tmate.sock wait tmate-ready\n\
echo "SSH: $(tmate -S /tmp/tmate.sock display -p "#{tmate_ssh}")"\n\
echo "WEB: https://tmate.io/t/$(tmate -S /tmp/tmate.sock display -p "#{tmate_web}")"\n\
# Fake web server to keep Railway web service alive\n\
while true; do echo "Server Running"; nc -l -p 8080 <<< "OK"; done' > /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
