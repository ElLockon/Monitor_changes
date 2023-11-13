#!/bin/bash

# Directory to monitor 
MONITORED_DIR="/etc/netplan"

# Function to monitor changes
monitor_changes() {
	inotifywait -r -m -e create,delete,modify,move --format '%w %f %:e %T %u' --timefmt '%Y-%m-%d %H:%M:%S' "$MONITORED_DIR" |
	while read -r directory file event timestamp user; do
		echo "Change detected in $directory$file:"
		echo "Event: $event"
		echo "Timestamp: $timestamp"
		echo "User: $user"
		echo
	done
}

# Main script
echo "Monitoring $MONITORED_DIR for changes. . . "

# Start monitoring
monitor_changes

