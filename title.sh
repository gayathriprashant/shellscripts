#!/bin/bash
title="Welcome to Bash shell scripting"
COLUMNS=$(tput cols)
title_size=${#title}
span=$((( $COLUMNS+ $title_size) / 2 ))
printf "%${COLUMNS}s" " " | tr " " "*"
printf "%${span}s\n" "${title}"
printf "%${COLUMNS}s" " " | tr " " "*"