#yes > /dev/null &
#https://winaero.com/how-to-create-100-cpu-load-in-linux/
#Stress-ng
while true; do
    PID=$(pidof -s yes || cat /proc/sys/kernel/pid_max)
    if [[ $(ps -p $PID -o %cpu= |grep -Po '^\s*\K[0-9]+') -gt 90 ]]; then
        echo killing PID $PID
        kill $PID
    fi
    sleep 1
done
