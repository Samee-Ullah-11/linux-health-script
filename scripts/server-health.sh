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


