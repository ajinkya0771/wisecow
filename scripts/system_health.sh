#!/bin/bash
# system_health.sh - Stable System Health Monitor Script

LOG_DIR="./logs"
LOG_FILE="$LOG_DIR/system_health.log"

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
DISK_MOUNT="/"

REQUIRED_PROCS=("python" "docker" "kubectl")

timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

log() {
  mkdir -p "$LOG_DIR"
  echo "[$(timestamp)] $1" | tee -a "$LOG_FILE"
}

# Safe CPU usage check (using mpstat or fallback)
get_cpu_usage() {
  if command -v mpstat >/dev/null 2>&1; then
    mpstat 1 1 | awk '/Average/ && $3 ~ /[0-9.]+/ {printf "%.0f\n", 100 - $12}'
  else
    grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f\n", usage}'
  fi
}

get_mem_usage() {
  free | awk '/Mem:/ {printf "%.0f\n", $3/$2 * 100.0}'
}

get_disk_usage() {
  df -h "$DISK_MOUNT" | awk 'NR==2 {gsub("%",""); print $5}'
}

STATUS=0
log "===== System Health Check starting... ====="

CPU_USAGE=$(get_cpu_usage)
MEM_USAGE=$(get_mem_usage)
DISK_USAGE=$(get_disk_usage)

log "CPU usage: ${CPU_USAGE}% (threshold ${CPU_THRESHOLD}%)"
if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
  log "⚠ ALERT: CPU usage above threshold!"
  STATUS=1
fi

log "Memory usage: ${MEM_USAGE}% (threshold ${MEM_THRESHOLD}%)"
if [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ]; then
  log "⚠ ALERT: Memory usage above threshold!"
  STATUS=1
fi

log "Disk usage on ${DISK_MOUNT}: ${DISK_USAGE}% (threshold ${DISK_THRESHOLD}%)"
if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
  log "⚠ ALERT: Disk usage above threshold!"
  STATUS=1
fi

for PROC in "${REQUIRED_PROCS[@]}"; do
  if ! pgrep -x "$PROC" >/dev/null; then
    log "⚠ ALERT: Process '$PROC' is NOT running!"
    STATUS=1
  fi
done

if [ "$STATUS" -eq 0 ]; then
  log "✅ System Health OK"
else
  log "❌ System Health issues detected."
fi

exit $STATUS

