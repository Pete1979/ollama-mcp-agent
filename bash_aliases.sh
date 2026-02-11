#!/bin/bash
# Add these aliases to your ~/.bashrc for quick LLM access
# 
# To install:
#   cat ~/projects/ollama-mcp-agent/bash_aliases.sh >> ~/.bashrc
#   source ~/.bashrc
#
# Or manually copy the lines below to your ~/.bashrc

# =============================================================================
# Ollama MCP Agent Aliases
# =============================================================================

# Main commands
alias llm='~/projects/ollama-mcp-agent/chat'
alias ask='~/projects/ollama-mcp-agent/ask'
alias agent='~/projects/ollama-mcp-agent/agent'           # 🤖 AI with command execution!
alias codehelp='~/projects/ollama-mcp-agent/code-helper'
alias llmfix='~/projects/ollama-mcp-agent/quick-fix'
alias llmodels='~/projects/ollama-mcp-agent/models'

# Model-specific shortcuts
alias llm-coder='~/projects/ollama-mcp-agent/chat qwen2.5-coder:3b'       # Balanced coder (default)
alias llm-coder-fast='~/projects/ollama-mcp-agent/chat qwen2.5-coder:1.5b' # Fastest coder
alias llm-coder-smart='~/projects/ollama-mcp-agent/chat qwen2.5-coder:7b'  # Smartest coder
alias llm-tiny='~/projects/ollama-mcp-agent/chat llama3.2:1b'         # Fastest
alias llm-fast='~/projects/ollama-mcp-agent/chat llama3.2:3b'         # Fast & capable
alias llm-smart='~/projects/ollama-mcp-agent/chat llama3.1:8b'        # Best reasoning

# Quick ask shortcuts
alias askcoder='~/projects/ollama-mcp-agent/ask'                       # Uses qwen2.5-coder (default)
alias askfast='f(){ ~/projects/ollama-mcp-agent/ask "$1" llama3.2:3b; }; f'
alias asksmart='f(){ ~/projects/ollama-mcp-agent/ask "$1" llama3.1:8b; }; f'

# Helper functions
llm-help() {
    cat ~/projects/ollama-mcp-agent/README.md
}

llm-status() {
    echo "Ollama Status:"
    systemctl status ollama | head -n 3
    echo ""
    echo "Installed Models:"
    ollama list
}

llm-context() {
    ~/projects/ollama-mcp-agent/get-system-context.sh
}

# Quick piping examples
alias llm-review='f(){ cat "$1" | ~/projects/ollama-mcp-agent/ask "Review this code for bugs and improvements"; }; f'
alias llm-explain='f(){ cat "$1" | ~/projects/ollama-mcp-agent/ask "Explain what this code does"; }; f'
alias llm-summarize='f(){ cat "$1" | ~/projects/ollama-mcp-agent/ask "Summarize this text"; }; f'
