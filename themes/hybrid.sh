#!/usr/bin/env bash

export PROFILE_NAME="Hybrid"

export COLOR_01="#282a2e"           # Black (Host)
export COLOR_02="#A54242"           # Red (Syntax string)
export COLOR_03="#8C9440"           # Green (Command)
export COLOR_04="#de935f"           # Yellow (Command second)
export COLOR_05="#5F819D"           # Blue (Path)
export COLOR_06="#85678F"           # Magenta (Syntax var)
export COLOR_07="#5E8D87"           # Cyan (Prompt)
export COLOR_08="#969896"           # White

export COLOR_09="#373b41"           # Bright Black
export COLOR_10="#cc6666"           # Bright Red (Command error)
export COLOR_11="#b5bd68"           # Bright Green (Exec)
export COLOR_12="#f0c674"           # Bright Yellow
export COLOR_13="#81a2be"           # Bright Blue (Folder)
export COLOR_14="#b294bb"           # Bright Magenta
export COLOR_15="#8abeb7"           # Bright Cyan
export COLOR_16="#c5c8c6"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#94a3a5"   # Foreground (Text)

export CURSOR_COLOR="#94a3a5" # Cursor

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
