#!/bin/bash
DOTFILES="$HOME/.dotfiles"

# Zsh
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/.zprofile" "$HOME/.zprofile"

# Config
ln -sf "$DOTFILES/.config/ghostty" "$HOME/.config/ghostty"
ln -sf "$DOTFILES/.config/nvim" "$HOME/.config/nvim"

echo "Dotfiles linked."
ln -sf "$DOTFILES/.config/zed" "$HOME/.config/zed"
ln -sf "$DOTFILES/cursor/settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"
ln -sf "$DOTFILES/cursor/keybindings.json" "$HOME/Library/Application Support/Cursor/User/keybindings.json"
