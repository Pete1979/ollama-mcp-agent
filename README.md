# Ollama MCP Agent

AI agent powered by Ollama + Model Context Protocol that can execute commands, manage Kubernetes, troubleshoot systems, and more. Fully local, offline-capable, with system awareness.

**Like Claude Code or GitHub Copilot CLI, but 100% free and runs locally!**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![Ollama](https://img.shields.io/badge/Ollama-Required-green.svg)](https://ollama.com/)

## ✨ Features

- 🤖 **MCP Agent** - LLM that can actually execute commands, not just suggest them
- 🧠 **Conversation Memory** - Remembers previous outputs for intelligent follow-up questions
- ⚡ **Smart Auto-Approval** - Safe operations execute immediately, dangerous ones need confirmation
- 🖥️ **System Aware** - Knows your OS, hardware, desktop environment, k8s context, Docker status
- ☸️ **Kubernetes Tools** - Health checks, pod logs, describe resources, multi-namespace queries
- 🪟 **Sway/Waybar Management** - View configs, add keybindings, restart/reload
- 🌐 **Network Management** - Show interfaces, configure DNS, manage connections
- ⚙️ **Systemd Control** - Service status, restart, logs, enable/disable
- 🔒 **Safety First** - Approval required for file writes, deletes, and dangerous operations
- 💾 **Offline Capable** - 100% local, no API keys, no subscriptions
- 🎨 **Multiple Models** - Choose speed vs. quality (3b is default, fast and capable)

## 🆚 Comparison

|  | Ollama MCP Agent | Claude Code | GitHub Copilot CLI |
|---|---|---|---|
| **Cost** | Free | $20/mo | $10/mo |
| **Privacy** | 100% local | Cloud-based | Cloud-based |
| **Offline** | ✅ Yes | ❌ No | ❌ No |
| **Command Execution** | ✅ Yes | ✅ Yes | ✅ Yes |
| **System Context** | ✅ Yes | Limited | Limited |
| **K8s Integration** | ✅ Built-in | Manual | Manual |
| **Conversation Memory** | ✅ Yes | ✅ Yes | Limited |
| **Open Source** | ✅ Yes | ❌ No | ❌ No |

## 🚀 Quick Start

### Prerequisites
- [Ollama](https://ollama.com/) installed and running
- Python 3.8+ (for MCP agent)
- Linux/macOS (Windows via WSL)

### Installation

```bash
# Clone the repo
git clone https://github.com/Pete1979/ollama-mcp-agent.git
cd ollama-mcp-agent

# Install MCP dependencies
pip install --user -r mcp-server/requirements.txt

# Pull the default model (fast and capable)
ollama pull qwen2.5-coder:3b

# Make scripts executable
chmod +x agent chat ask code-helper models quick-fix

# Try the agent!
./agent -i
```

### First Steps

```bash
# Interactive agent mode
./agent -i
> check my disk space
> show my sway keybindings
> restart waybar
> check my kubernetes cluster for issues

# One-off commands - System Management
./agent "show my waybar config"
./agent "restart docker service"
./agent "list network connections"

# Kubernetes Management
./agent "show pods in prometheus namespace"
./agent "check for failing pods"

# Traditional chat without command execution
./chat
./ask "How do I optimize Docker on my system?"
```

## 🎯 Default Model

**qwen2.5-coder:3b** - Fast and capable coding model with full system awareness

Other options:
- **7b** - Slower but more capable for complex reasoning
- **14b** - Most capable, requires 16GB+ RAM

## 🔍 System Context Feature

All scripts now automatically provide the LLM with:
- Your system info (OS: Fedora Linux 43, Kernel: 6.18.8)
- Hardware: AMD Ryzen AI 9 HX PRO 375 (24 cores, 62GB RAM, Radeon 890M GPU)
- NPU: AMD Strix/Krackan Neural Processing Unit (detected)
- Current directory and git status
- Kubernetes context (k8s/grafana namespace)
- Docker status
- Available projects in ~/projects

**The LLM knows your system and can give specific advice for YOUR setup!**

To skip system context, add `--no-context` flag.

## 🤖 MCP Agent (NEW!)

**The LLM can now execute commands!** Using Model Context Protocol, the agent can:
- Execute bash commands
- Read and write files
- Check system status (disk, memory, CPU, network)
- Manage Kubernetes resources
- Show network interfaces
- **Auto-approves safe operations** (file writes still need confirmation)
- **Remembers conversation context** for follow-up questions

```bash
./agent -i                              # Interactive mode
./agent "check my k8s cluster health"
./agent "show pods in prometheus namespace"
./agent "list all namespaces"
```

See [MCP-AGENT-README.md](MCP-AGENT-README.md) for full documentation.

## 📚 Scripts

### `agent` 🆕
AI agent that can execute commands and manage your system.
```bash
./agent -i                                    # Interactive mode (recommended)
./agent "check disk space"                    # One-off command
./agent "find pods with issues"               # Kubernetes health check
./agent "show logs for that pod"              # Follow-up questions work!
```

### `chat`
Interactive chat session with your LLM.
```bash
./chat                  # Use default model (qwen2.5-coder:3b)
./chat qwen2.5-coder:7b # Use smarter/slower model
```

### `ask`
One-off questions without starting a chat session.
```bash
./ask "How do I use grep?"
./ask "Explain async/await in Python"
./ask --no-context "What is 2+2?"  # Skip system context for speed
```

### `code-helper`
Specialized for programming questions.
```bash
./code-helper          # Start interactive coding assistant
```

### `quick-fix`
Analyze errors and get fix suggestions.
```bash
./quick-fix "TypeError: cannot read property 'foo' of undefined"
cat error.log | ./quick-fix
```

### `models`
Manage your Ollama models.
```bash
./models list          # Show installed models
./models pull          # Download new model
./models switch        # Pick a model to chat with
./models remove        # Delete a model
```

## Bash Aliases (Optional)

Run `./install-aliases.sh` to automatically install, or add these to your `~/.bashrc`:

```bash
# LLM aliases
alias llm='~/projects/ollama-mcp-agent/chat'
alias ask='~/projects/ollama-mcp-agent/ask'
alias agent='~/projects/ollama-mcp-agent/agent -i'     # NEW!
alias codehelp='~/projects/ollama-mcp-agent/code-helper'
alias llmfix='~/projects/ollama-mcp-agent/quick-fix'
alias llmodels='~/projects/ollama-mcp-agent/models'

# Model-specific shortcuts
alias llm-coder='~/projects/ollama-mcp-agent/chat qwen2.5-coder:3b'
alias llm-coder-fast='~/projects/ollama-mcp-agent/chat qwen2.5-coder:1.5b'
alias llm-coder-smart='~/projects/ollama-mcp-agent/chat qwen2.5-coder:7b'
```

Then reload: `source ~/.bashrc`

## Tips

1. **Use the right tool:**
   - Just want advice? → `./ask` or `./chat`
   - Need it to DO something? → `./agent`
   - Kubernetes troubleshooting? → `./agent -i` with health checks

2. **Use the right model for the task:**
   - Quick questions → qwen2.5-coder:3b (default, recommended)
   - Complex tasks → qwen2.5-coder:7b (slower, more capable)
   - Maximum capability → qwen2.5-coder:14b (slowest, smartest)
   - See `./performance-guide.sh` for comparisons

3. **Pipe content directly:**
   ```bash
   cat myfile.py | ./ask "Review this code"
   ./ask "Summarize this" < document.txt
   kubectl get pods | ./ask "any issues here?"
   ```

4. **Use in scripts:**
   ```bash
   response=$(./ask "What is 2+2?")
   echo "$response"
   
   # Agent can execute commands in scripts too
   ./agent "check if port 8080 is in use"
   ```

5. **Conversation context with agent:**
   ```bash
   ./agent -i
   > check my cluster for issues
   > show logs for that pod
   > what's causing this error?  # Remembers previous output!
   ```

## Examples

```bash
# Quick Linux command help
./ask "How to find large files in /var/log?"

# MCP Agent - actually DO things
./agent "check my disk space"
./agent "show all kubernetes namespaces"
./agent "find any pods with issues"
./agent "get logs from that error pod"

# Interactive troubleshooting
./agent -i
> check my cluster for issues
> describe that pod
> can you help fix this error?

# Code review
./code-helper
> Review this Python function for bugs: def calc(x): return x/0

# Error debugging
./quick-fix "fatal: unable to access 'https://github.com/...': SSL certificate problem"

# Learn new concepts with system context
./chat
> How do I deploy an app to MY kubernetes cluster?
# LLM knows you're on k8s context and can give specific advice!

# Generate code
./ask "Write a bash script to backup a directory with timestamp"
```

## Advanced: API Mode

You can also use Ollama's REST API:

```bash
# Generate completion
curl http://localhost:11434/api/generate -d '{
  "model": "qwen2.5-coder:3b",
  "prompt": "Write a Python hello world",
  "stream": false
}'

# Chat endpoint
curl http://localhost:11434/api/chat -d '{
  "model": "qwen2.5-coder:3b",
  "messages": [{"role": "user", "content": "Hello!"}],
  "stream": false
}'
```

## Troubleshooting

**Ollama not running?**
```bash
sudo systemctl start ollama
systemctl status ollama
```

**Model not found?**
```bash
./models list           # Check installed models
ollama pull qwen2.5-coder:3b  # Download model
```

**Slow responses?**
- Use 1.5b model: `./agent -m qwen2.5-coder:1.5b -i`
- Skip system context: `./ask "question" --no-context`
- Check `./performance-guide.sh` for optimization tips

**Agent not generating good commands?**
- Try the 7b model for complex tasks: `./agent -m qwen2.5-coder:7b -i`
- Be more specific in your requests
- Use interactive mode for follow-up clarifications

## 🤝 Contributing

Contributions welcome! Feel free to:
- Report bugs
- Suggest features
- Submit pull requests
- Improve documentation

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details

## 🙏 Credits

- [Ollama](https://ollama.com/) - Local LLM runtime
- [Model Context Protocol](https://modelcontextprotocol.io/) - Tool integration standard
- Inspired by [NetworkChuck's AI in Terminal](https://github.com/theNetworkChuck/ai-in-the-terminal)

## ⭐ Star History

If you find this useful, please star the repo!

---

**Made with ❤️ for the open source community**
