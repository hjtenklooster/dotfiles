#!/bin/bash

ensure_directory_exists() {
    local directory_path="$1"

    if [ ! -d "$directory_path" ]; then
        mkdir -p "$directory_path"
    fi
}

create_symlink() {
    local source_file="$1"
    local destination_file="$2"

echo $source_file
echo $destination_file

    # Check if two arguments are provided
    if [ -z "$source_file" ] || [ -z "$destination_file" ]; then
        echo "Usage: create_symlink <source_file> <destination_file>"
        return 1
    fi

    # Check if destination is already a symlink
    if [ -L "$destination_file" ]; then
        return 1
    else
        rm -rf "$destination_file"
    fi

    # Create the symlink
    ln -s "$source_file" "$destination_file"
    echo "Symlink created from $source_file to $destination_file."
}

dotfiles_directory="${HOME}/src/dotfiles"

# Configure dotfile karabiner
ensure_directory_exists "${HOME}/.config"

create_symlink $dotfiles_directory"/karabiner" "${HOME}/.config/karabiner"

