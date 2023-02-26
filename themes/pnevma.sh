#!/usr/bin/env bash

export PROFILE_NAME="Pnevma"

export COLOR_01="#2f2e2d"           # Black (Host)
export COLOR_02="#a36666"           # Red (Syntax string)
export COLOR_03="#90a57d"           # Green (Command)
export COLOR_04="#d7af87"           # Yellow (Command second)
export COLOR_05="#7fa5bd"           # Blue (Path)
export COLOR_06="#c79ec4"           # Magenta (Syntax var)
export COLOR_07="#8adbb4"           # Cyan (Prompt)
export COLOR_08="#d0d0d0"           # White

export COLOR_09="#4a4845"           # Bright Black
export COLOR_10="#d78787"           # Bright Red (Command error)
export COLOR_11="#afbea2"           # Bright Green (Exec)
export COLOR_12="#e4c9af"           # Bright Yellow
export COLOR_13="#a1bdce"           # Bright Blue (Folder)
export COLOR_14="#d7beda"           # Bright Magenta
export COLOR_15="#b1e7dd"           # Bright Cyan
export COLOR_16="#efefef"           # Bright White

export BACKGROUND_COLOR="#1c1c1c"   # Background
export FOREGROUND_COLOR="#d0d0d0"   # Foreground (Text)

export CURSOR_COLOR="#d0d0d0" # Cursor

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
