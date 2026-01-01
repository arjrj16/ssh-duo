#!/bin/bash
# Install sshduo command

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔧 Installing sshduo..."

# Make executable
chmod +x "$SCRIPT_DIR/sshduo"

# Create ~/.local/bin and symlink
mkdir -p ~/.local/bin
ln -sf "$SCRIPT_DIR/sshduo" ~/.local/bin/sshduo

# Add to PATH if needed
if ! echo "$PATH" | grep -q "/.local/bin"; then
    echo '' >> ~/.zshrc
    echo '# sshduo' >> ~/.zshrc  
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
    echo "Added ~/.local/bin to PATH in ~/.zshrc"
fi

echo ""
echo "✅ Installed!"
echo ""
echo "Run 'source ~/.zshrc' or open a new terminal, then:"
echo "  sshduo --config    Set credentials"
echo "  sshduo -a          Connect to Athena"
echo "  sshduo -o          Connect to ORCD"
