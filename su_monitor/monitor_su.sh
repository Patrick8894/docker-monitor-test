#!/bin/bash

script_path="$0"
script_dir="$(dirname "$script_path")"
log_file="/var/log/auth.log"
filename="$script_dir/authCmdCalled.txt"
metric_file="$script_dir/../custom-metrics/authCmdCalled_metric.prom"
metric_name="authCmdCalled"

if [ ! -f "$filename" ]; then
    line_count=$(awk '$5 ~ /^su/ {print}' $log_file | wc -l)
    echo "$line_count" >> "$filename"
fi

new_line_count=$(awk '$5 ~ /^su/ {print}' $log_file | wc -l)
line_count=$(cat "$filename")
if [ "$new_line_count" -gt "$line_count" ]; then
    echo "hacked!!"
    echo "$metric_name 1" > $metric_file
else
    echo "not hacked!!"
    echo "$metric_name 0" > $metric_file
fi

echo -n > $filename
echo "$new_line_count" >> "$filename"