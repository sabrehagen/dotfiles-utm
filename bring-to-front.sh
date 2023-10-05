osascript \
  -e 'tell application "System Events"' \
  -e "tell application process \"$@\"" \
  -e 'set frontmost to true' \
  -e 'end tell' \
  -e 'end tell'
