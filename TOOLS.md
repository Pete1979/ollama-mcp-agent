# Available Tools

Quick reference for the agent's specialized tools.

## 🪟 Sway

```bash
./agent "show my sway config"
./agent "list sway keybindings"
./agent "add keybinding Mod+d to exec rofi -show drun"
./agent "reload sway"
```

## 🎨 Waybar

```bash
./agent "show waybar config"
./agent "restart waybar"
./agent "reload waybar"
```

## 🌐 Network

```bash
./agent "show network status"
./agent "list network connections"
./agent "scan wifi networks"
./agent "set DNS to 8.8.8.8 for connection 'Wired connection 1'"
```

## ⚙️ Systemd

```bash
./agent "check docker status"
./agent "restart networkmanager"
./agent "show sshd logs"
./agent "enable docker"
./agent "list all services"
```

## ☸️ Kubernetes

```bash
./agent "show pods in grafana namespace"
./agent "check for failing pods"
./agent "get pod logs for grafana-xxx in grafana namespace"
./agent "describe pod gpu-operator-xxx in gpu-operator namespace"
```

## 💻 System

```bash
./agent "check disk space"
./agent "show memory usage"
./agent "what's my IP"
./agent "list running docker containers"
```

---

## Tips

- **Be specific**: "show waybar config" works better than "help with waybar"
- **Use natural language**: The agent understands conversational requests
- **Chain requests**: "check if docker is running and show containers"
