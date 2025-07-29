#!/usr/bin/env bash

# Post-yabai startup script
# This script runs after yabai starts to organize spaces and set layouts

# Configuration: List of spaces to organize
# Add or remove space indices as needed
ORGANIZE_SPACES=(2 3)

# Path to the organize script
ORGANIZE_SCRIPT="$HOME/.config/skhd/organize"

# Function to log messages with timestamp
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Function to run organize script for specified spaces
organize_spaces() {
    log_message "Starting space organization..."

    for space_idx in "${ORGANIZE_SPACES[@]}"; do
        if [[ -x "$ORGANIZE_SCRIPT" ]]; then
            log_message "Running organize script for space $space_idx"
            "$ORGANIZE_SCRIPT" "$space_idx"
        else
            log_message "Warning: Organize script not found or not executable at $ORGANIZE_SCRIPT"
        fi
    done

    log_message "Space organization completed"
}

# Function to set stack layout for all spaces on primary display
set_primary_display_layout() {
    log_message "Setting stack layout for primary display spaces..."

    # Query displays to find the primary display (index 1 is typically the main display)
    local primary_display_index
    primary_display_index=$(yabai -m query --displays | jq -r ".[] | select(.id == 1) | .index")

    # Get all spaces on the primary display
    local spaces_on_primary
    spaces_on_primary=$(yabai -m query --spaces --display "$primary_display_index" | jq -r '.[].index')

    if [[ -z "$spaces_on_primary" ]]; then
        log_message "Warning: Could not query spaces on primary display"
        return 1
    fi

    # Set each space on primary display to stack layout
    while IFS= read -r space_index; do
        if [[ -n "$space_index" ]]; then
            log_message "Setting space $space_index to stack layout"
            yabai -m space "$space_index" --layout stack
        fi
    done <<< "$spaces_on_primary"

    log_message "Primary display layout configuration completed"
}

# Function to wait for yabai to be fully ready
wait_for_yabai() {
    log_message "Waiting for yabai to be ready..."

    local max_attempts=10
    local attempt=1

    while [[ $attempt -le $max_attempts ]]; do
        if yabai -m query --displays &>/dev/null; then
            log_message "Yabai is ready"
            return 0
        fi

        log_message "Attempt $attempt/$max_attempts: Yabai not ready yet, waiting..."
        sleep 2
        ((attempt++))
    done

    log_message "Error: Yabai did not become ready within expected time"
    return 1
}

# Main execution
main() {
    log_message "Post-yabai startup script started"

    # Wait for yabai to be fully ready
    if ! wait_for_yabai; then
        log_message "Exiting due to yabai readiness timeout"
        exit 1
    fi

    # Small additional delay to ensure stability
    sleep 1

    # Run space organization
    organize_spaces

    # Set primary display layout
    set_primary_display_layout

    log_message "Post-yabai startup script completed successfully"
}

# Check if jq is available (required for JSON parsing)
if ! command -v jq &> /dev/null; then
    log_message "Error: jq is required but not installed. Please install jq first."
    exit 1
fi

# Run main function
main "$@"
