FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    curl ca-certificates lsb-release wget zip unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 claude && useradd -m -u 1000 -g claude -s /bin/bash claude
RUN chown -R claude:claude /home/claude

WORKDIR /workspace
RUN chown -R claude:claude /workspace

USER claude

ENV PATH="/home/claude/.local/bin:${PATH}"
RUN curl -fsSL https://claude.ai/install.sh | bash

ENTRYPOINT ["claude", "--dangerously-skip-permissions"]
