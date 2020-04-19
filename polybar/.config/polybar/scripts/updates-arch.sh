#!/bin/sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

updates=$(("$updates_arch"))

if [ "$updates" -gt 0 ]; then
	echo "  $updates Update(s) "
else
    echo ""
fi
