FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        libatomic1 \
        lsb-release \
        nano \
        sudo \
        unzip \
        vim \
        wget \
        zip && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 claude && \
    useradd -m -u 1000 -g claude -d /claude -s /bin/bash claude

RUN mkdir -p /workspace && \
    chown -R claude:claude /workspace && \
    echo "claude ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/claude && \
    chmod 0440 /etc/sudoers.d/claude

WORKDIR /workspace

USER claude

ENV PATH="/claude/.local/bin:${PATH}"

RUN curl -fsSL https://claude.ai/install.sh | bash
RUN echo 'alias claude="claude --dangerously-skip-permissions"' >> ~/.bashrc

CMD ["bash"]
