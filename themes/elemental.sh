#!/usr/bin/env bash

export PROFILE_NAME="Elemental"

export COLOR_01="#3c3c30"           # Black (Host)
export COLOR_02="#98290f"           # Red (Syntax string)
export COLOR_03="#479a43"           # Green (Command)
export COLOR_04="#7f7111"           # Yellow (Command second)
export COLOR_05="#497f7d"           # Blue (Path)
export COLOR_06="#7f4e2f"           # Magenta (Syntax var)
export COLOR_07="#387f58"           # Cyan (Prompt)
export COLOR_08="#807974"           # White

export COLOR_09="#555445"           # Bright Black
export COLOR_10="#e0502a"           # Bright Red (Command error)
export COLOR_11="#61e070"           # Bright Green (Exec)
export COLOR_12="#d69927"           # Bright Yellow
export COLOR_13="#79d9d9"           # Bright Blue (Folder)
export COLOR_14="#cd7c54"           # Bright Magenta
export COLOR_15="#59d599"           # Bright Cyan
export COLOR_16="#fff1e9"           # Bright White

export BACKGROUND_COLOR="#22211d"   # Background
export FOREGROUND_COLOR="#807a74"   # Foreground (Text)

export CURSOR_COLOR="#807a74" # Cursor

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
