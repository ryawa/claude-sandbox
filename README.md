# claude-sandbox

## Usage
First setup a terminal alias:
```
alias sandbox='docker run -it  \
    -v $(pwd):/workspace/${PWD##*/} \
    -v ~/.claude-sandbox/.claude:/claude/.claude \
    -v ~/.claude-sandbox/.claude.json:/claude/.claude.json \
    -w /workspace/${PWD##*/} \
    claude-sandbox'
```

Then just do `sandbox`.
