# MCP-Enabled AI Agent

🤖 **Your LLM can now execute commands!**

## What is this?

An AI agent that combines your local LLM (qwen2.5-coder) with MCP (Model Context Protocol) to actually execute commands, not just suggest them.

## 🚀 Quick Start

### Ask it to do something:
```bash
./agent "check my disk space"
./agent "show me my network interfaces"
./agent "what docker containers are running?"
```

### Interactive mode (recommended):
```bash
./agent -i
```

Then ask things like:
- "Show me system memory usage"
- "List all files in /home/peter/projects"
- "Check if docker is running"
- "What's my current kubernetes context?"

## 🛡️ Safety Features

**Every command requires your approval** before execution!

When the LLM wants to do something, you'll see:
```
🤖 LLM wants to:
Configure network DNS

Tool: execute_command
Arguments:
  command: nmcli device modify eth0 ipv4.dns 8.8.8.8

Allow this action? [y/N/show]:
```

Options:
- `y` - Yes, execute it
- `N` - No, cancel (default)
- `show` - Show full details before deciding

### Auto-approve mode (use with caution!):
```bash
./agent -y "show disk space"
```

## 🔧 Available Capabilities

The LLM can:

### Execute Commands
```bash
./agent "list all python files in current directory"
./agent "show me the last 10 lines of /var/log/syslog"
```

### File Operations
```bash
./agent "read the file /etc/hostname"
./agent "create a file at /tmp/test.txt with content 'hello'"
```

### Network Management
```bash
./agent "show network interface status"
./agent "what are my network connections?"
```

### System Status
```bash
./agent "check system memory"
./agent "show disk usage"
./agent "check docker status"
./agent "list kubernetes pods"
```

## 📋 Command Line Options

```bash
./agent "your request"                    # One-off request
./agent -i                                 # Interactive mode
./agent -y "request"                       # Auto-approve (dangerous!)
./agent -m qwen2.5-coder:7b "request"     # Use different model
```

## 🎯 Example Use Cases

### Network Configuration
```bash
You: Show my network interfaces
LLM: [generates nmcli command, asks for approval]
You: y
Result: [shows interface status]
```

### System Maintenance
```bash
./agent "check which services are using the most memory"
./agent "show me the 5 largest files in /var/log"
```

### Development Tasks
```bash
./agent "count how many Python files are in ~/projects"
./agent "show git status for all repos in ~/projects"
```

### Docker/Kubernetes
```bash
./agent "list all running containers"
./agent "show pods in grafana namespace"
./agent "get deployments in prometheus namespace"
./agent "list all kubernetes namespaces"
./agent "show all resources in current namespace"
```

## ⚙️ Configuration

### Change default model:
```bash
./agent -m qwen2.5-coder:1.5b -i    # Use faster model
./agent -m qwen2.5-coder:7b -i      # Use smarter model
```

### Environment variables:
```bash
export OLLAMA_MODEL=qwen2.5-coder:7b
./agent -i
```

## 🔒 Security

**Important:** The agent can execute ANY command it generates!

Safety measures:
1. ✅ **Approval required** by default
2. ✅ Shows exactly what it will do
3. ✅ You can review before execution
4. ⚠️ Use `-y` auto-approve ONLY for trusted queries

**Never use `-y` with:**
- Untrusted input
- Network configuration changes
- System-wide changes
- File deletions

## 🎓 Tips

### Be specific:
❌ "fix network"
✅ "show me my network interface status"

### Ask follow-up questions:
```
You: check disk space
Agent: [shows df -h output]
You: which directory is using the most space?
Agent: [analyzes and shows du output]
```

### Use it with pipes (advanced):
```bash
echo "check system memory" | ./agent -y
```

## 🐛 Troubleshooting

**Agent not responding?**
- Check if Ollama is running: `systemctl status ollama`
- Try a simpler query first

**Commands failing?**
- Some commands need sudo (agent will tell you)
- Run with sudo if needed: `sudo ./agent "command"`

**Wrong commands generated?**
- Try being more specific
- Use a smarter model: `-m qwen2.5-coder:7b`

## 🆚 vs Regular LLM

**Regular ask/chat:**
```bash
./ask "how do I check disk space?"
# Returns: "Use df -h command..." (you copy and run it)
```

**With agent:**
```bash
./agent "check disk space"
# LLM generates command, asks permission, runs it, shows results
```

## 🔗 Integration with existing tools

You can still use the regular scripts:
- `./ask` - Just get advice
- `./chat` - Just chat
- `./agent` - Actually do things

## � Available MCP Tools

The agent has these built-in tools:

### execute_command
Run any bash command
```bash
./agent "list files in /tmp"
```

### read_file
Read file contents
```bash
./agent "read /etc/hostname"
```

### write_file
Write content to files (requires approval)
```bash
./agent "create a file test.txt with hello world"
```

### network_info
Show network interface status
```bash
./agent "show network interfaces"
```

### kubernetes
Manage Kubernetes resources
```bash
./agent "show pods in grafana namespace"
./agent "list all namespaces"
./agent "get deployments in default namespace"
```

Arguments:
- `action`: pods, deployments, services, namespaces, all
- `namespace`: (optional) target namespace

### system_status
Check system resources
```bash
./agent "check disk space"
./agent "show memory usage"
./agent "check kubernetes cluster"
```

Components: cpu, memory, disk, network, docker, kubernetes, all

## �📚 More Examples

```bash
# System info
./agent "show me cpu info"
./agent "what's my system uptime?"

# File management
./agent "find all log files larger than 100MB"
./agent "count lines in all .py files here"

# Network diagnostics
./agent "test if I can reach 8.8.8.8"
./agent "show my current IP address"

# Docker
./agent "how many containers are running?"
./agent "show logs for latest container"

# Kubernetes
./agent "list all pods in current namespace"
./agent "show pods in prometheus namespace"
./agent "get all deployments"
./agent "list all namespaces"
./agent "describe the pod named xyz"
```

## ⚡ Pro Tips

1. **Start with read-only commands** to get comfortable
2. **Use interactive mode (`-i`)** for complex tasks
3. **Review generated commands** before approving
4. **Combine with regular chat** for planning first:
   ```bash
   ./chat  # Plan what to do
   ./agent  # Actually do it
   ```

Enjoy your AI assistant with actual system access! 🎉
