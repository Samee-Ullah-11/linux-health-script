echo  "======================================"
echo  "         server check"
echo  "======================================="

echo  ""
echo "Hostname:"
hostname

echo ""
echo "current user:"
whoami

echo ""
echo "data and time:"
date

echo ""
echo "system uptime:"
uptime

echo ""
echo "CPU information:"
nproc

echo ""
echo "CPU uptime:"
uptime

echo ""
echo "Memory usage:"
free -h

echo ""
echo "disk usage:"
df -h


echo ""
echo "Network connection:"
if ping -c 2 google.com > /dev/null 2>&1; then
   echo  "internet connection : OK "
else
   echo  "Internet connection : Failed"
fi

echo ""
echo "service status:"
if systemctl is-active --quiet cron; then
   echo "Cron service: runnig"
else
   echo "Cron service: stopped"
fi


echo ""
echo "disk usage:"
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Disk usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -lt 80 ]; then
   echo "disk status: OK"
elif [ "$DISK_STATUS" -lt 90 ]; then
   echo "disk status: warning"
else 
    echo " disk status : critical"
fi


echo ""
echo "CPU usage check:"
CPU_USAGE=$(top -bn1 |grep "Cpu(s)" | awk -F',' '{print 100 -$4}' | awk '{print int ($1)}')
CPU_USAGE=${CPU_USAGE%.*}

echo "CPU usage: $CPU_USAGE%"
if [ "$CPU_USAGE" -lt 70 ]; then
   echo "cpu status: ok"
elif [ "$CPU_USAGE" -lt 90 ]; then
   echo "cpu status: warning"
else
   echo "CPU status critical"
fi
