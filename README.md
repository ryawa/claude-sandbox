# claude-sandbox

## Installation
Build with `docker build -t claude-sandbox .` or pull from GHCR

## Usage
Setup config files:
```
mkdir -p ~/.claude-sandbox/.claude
touch ~/.claude-sandbox/.claude.json
```
Then run the container:
```
docker run --rm -it \
    -v $(pwd):/workspace/${PWD##*/} \
    -v ~/.claude-sandbox/.claude:/home/claude/.claude \
    -v ~/.claude-sandbox/.claude.json:/home/claude/.claude.json \
    -w /workspace/${PWD##*/} \
    claude-sandbox'
```
