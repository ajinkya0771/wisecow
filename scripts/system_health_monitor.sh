#!/usr/bin/env bash
# System Health Monitoring Script
# Writes a short report to /tmp/system_health.log and emits alerts in the log
# Configure thresholds as needed.

CPU_THRESHOLD=80   # percent
MEM_THRESHOLD=80   # percent
DISK_THRESHOLD=80  # percent (root filesystem)

LOG_FILE="/tmp/system_health.log"

timestamp() { date +"%Y-%m-%d %H:%M:%S"; }

echo "==== System Health Check $(timestamp) ====" >> "$LOG_FILE"

# CPU (uses 100 - idle)
cpu_usage=$(top -bn1 | awk -F',' '/Cpu/ {idle=$4; gsub(/ id/,"",idle); print 100 - idle}')
cpu_int=${cpu_usage%.*}
echo "CPU Usage: ${cpu_usage}% (int=${cpu_int})" >> "$LOG_FILE"
if [ "$cpu_int" -ge "$CPU_THRESHOLD" ]; then
  echo "ALERT: CPU usage above ${CPU_THRESHOLD}% -> ${cpu_usage}%" >> "$LOG_FILE"
fi

# Memory
mem_usage=$(free | awk '/Mem/{printf("%.1f", $3/$2*100)}')
mem_int=${mem_usage%.*}
echo "Memory Usage: ${mem_usage}%" >> "$LOG_FILE"
if [ "$mem_int" -ge "$MEM_THRESHOLD" ]; then
  echo "ALERT: Memory usage above ${MEM_THRESHOLD}% -> ${mem_usage}%" >> "$LOG_FILE"
fi

# Disk (root '/')
disk_usage=$(df --output=pcent / | tail -1 | tr -d ' %')
echo "Disk Usage(/): ${disk_usage}%" >> "$LOG_FILE"
if [ "$disk_usage" -ge "$DISK_THRESHOLD" ]; then
  echo "ALERT: Disk usage above ${DISK_THRESHOLD}% -> ${disk_usage}%" >> "$LOG_FILE"
fi

# Optional: top 5 memory processes
echo "Top 5 memory-consuming processes:" >> "$LOG_FILE"
ps aux --sort=-%mem | awk 'NR<=6{print}' >> "$LOG_FILE"

echo "=====================================" >> "$LOG_FILE"
echo "Health check completed. See $LOG_FILE"
