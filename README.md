# Nginx-Log-Analyser

https://roadmap.sh/projects/nginx-log-analyser

This script meets all the requirements specified in the image. Here's how to use it:

1. Save the script as `nginx_analyzer.sh`
2. Make it executable: `chmod +x nginx_analyzer.sh`
3. Run it with your log file: `./nginx_analyzer.sh access.log`

The script will:
1. Check if a log file was provided as an argument
2. Verify the file exists
3. Process the log file to extract:
   - Top 5 IP addresses with most requests
   - Top 5 most requested paths
   - Top 5 response status codes
   - Top 5 user agents

The script uses `awk` to process the log file and extract specific fields, `sort` and `uniq -c` to count unique occurrences, and `sort -rn` to sort numerically in reverse order. The output is formatted for easy reading.
