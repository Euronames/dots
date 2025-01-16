#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title dots
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Dots
# @raycast.author Euronames
# @raycast.authorURL https://raycast.com/Euronames

DOTFILES="${HOME}/Projects/dots"
git -C $DOTFILES add -A
git -C $DOTFILES commit -m '🛠️'
git -C $DOTFILES push
