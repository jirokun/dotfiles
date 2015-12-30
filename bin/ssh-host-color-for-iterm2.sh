#!/usr/bin/env sh

# convert 255 color to 65535
conv_color() {
  expr $1 \* 65535 / 255
}
set_term_bgcolor255() {
  local R=`conv_color $1`
  local G=`conv_color $2`
  local B=`conv_color $3`
  set_term_bgcolor $R $G $B
}
set_term_bgcolor() {
  local R=$1
  local G=$2
  local B=$3
  /usr/bin/osascript <<EOF
tell application "iTerm"
  tell the current terminal
    tell the current session
      set background color to {$R, $G, $B}
    end tell
  end tell
end tell
EOF
}
get_term_bgcolor() {
  /usr/bin/osascript <<EOF
tell application "iTerm"
  tell the current terminal
    tell the current session
      get background color
    end tell
  end tell
end tell
EOF
}
BEFORE=`get_term_bgcolor | tr -s ',' ' '`
#if [[ "$@" =~ rptapp ]]; then
set_term_bgcolor255 80 0 0
#elif [[ "$@" =~ hogeserver ]]; then
#  set_term_bgcolor255 0 40 0
#fi

ssh $@

set_term_bgcolor $BEFORE $BEFORE[0] $BEFORE[1] $BEFORE[2]
