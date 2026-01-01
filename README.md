# sshduo

Quick SSH with automatic Duo SMS authentication for MIT servers.

## Installation

```bash
./install.sh
```

Or manually:
```bash
mkdir -p ~/.local/bin
ln -sf "$(pwd)/sshduo" ~/.local/bin/sshduo
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

## Setup

Configure your credentials (stored in `~/.sshduo.json`):
```bash
sshduo --config
```

## Usage

```bash
sshduo -a          # Connect to Athena (athena.dialup.mit.edu)
sshduo --athena    # Same as above

sshduo -o          # Connect to ORCD (orcd-login.mit.edu)
sshduo --orcd      # Same as above

sshduo my.server.mit.edu   # Connect to custom host

sshduo --help      # Show help
```

## How It Works

1. Connects via SSH and enters your password
2. Selects Duo SMS option (3)
3. Reads the passcode from your Mac's iMessage database
4. Enters the code automatically
5. Hands off to interactive shell

## Requirements

- macOS with iMessage receiving SMS
- Python 3.10+
- pexpect (`pip install pexpect`)

## Troubleshooting

**"Cannot access Messages database"**
- Grant Full Disk Access to your terminal app:
  System Settings → Privacy & Security → Full Disk Access → Add Terminal

**Credentials not working**
- Re-run `sshduo --config` to update

## Adding More Servers

Edit the `SERVERS` dict in `sshduo`:
```python
SERVERS = {
    "athena": "athena.dialup.mit.edu",
    "orcd": "orcd-login.mit.edu",
    "newserver": "new.server.mit.edu",
}
```
