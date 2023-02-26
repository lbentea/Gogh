#!/usr/bin/env bash

export PROFILE_NAME="Broadcast"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#da4939"           # Red (Syntax string)
export COLOR_03="#519f50"           # Green (Command)
export COLOR_04="#ffd24a"           # Yellow (Command second)
export COLOR_05="#6d9cbe"           # Blue (Path)
export COLOR_06="#d0d0ff"           # Magenta (Syntax var)
export COLOR_07="#6e9cbe"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#ff7b6b"           # Bright Red (Command error)
export COLOR_11="#83d182"           # Bright Green (Exec)
export COLOR_12="#ffff7c"           # Bright Yellow
export COLOR_13="#9fcef0"           # Bright Blue (Folder)
export COLOR_14="#ffffff"           # Bright Magenta
export COLOR_15="#a0cef0"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#2b2b2b"   # Background
export FOREGROUND_COLOR="#e6e1dc"   # Foreground (Text)

export CURSOR_COLOR="#e6e1dc" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
