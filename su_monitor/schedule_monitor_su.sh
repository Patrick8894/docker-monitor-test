script_dir="$(pwd)"
if ! (crontab -l | grep "* * * * * $script_dir/su_monitor/monitor_su.sh"); then
    echo "* * * * * $script_dir/su_monitor/monitor_su.sh" | crontab -
fi