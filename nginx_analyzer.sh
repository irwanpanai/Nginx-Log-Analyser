#!/bin/bash

# Check if log file is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <nginx_access_log_file>"
    exit 1
fi

log_file="$1"

# Check if file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file '$log_file' not found"
    exit 1
fi

echo "=== Nginx Log Analysis Report ==="
echo

# Top 5 IP addresses with most requests
echo "Top 5 IP Addresses by Request Count:"
awk '{print $1}' "$log_file" | sort | uniq -c | sort -rn | head -n 5 | \
    awk '{printf "%5d requests from %s\n", $1, $2}'
echo

# Top 5 most requested paths
echo "Top 5 Most Requested Paths:"
awk '{print $7}' "$log_file" | sort | uniq -c | sort -rn | head -n 5 | \
    awk '{printf "%5d requests for %s\n", $1, $2}'
echo

# Top 5 response status codes
echo "Top 5 Response Status Codes:"
awk '{print $9}' "$log_file" | sort | uniq -c | sort -rn | head -n 5 | \
    awk '{printf "%5d occurrences of status code %s\n", $1, $2}'
echo

# Top 5 user agents
echo "Top 5 User Agents:"
awk -F '"' '{print $6}' "$log_file" | sort | uniq -c | sort -rn | head -n 5 | \
    awk '{$1=""; printf "%s\n", substr($0,2)}'
