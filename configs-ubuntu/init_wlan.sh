#!/system/bin/sh

for i in 1 2 3 4 5; do
    # sleep first to avoid issue when called after conn_init
    sleep 1
    if [ ! -f /sys/devices/platform/wcnss_wlan.0/net/wlan0/address ]; then
        echo sta > /sys/module/wlan/parameters/fwpath
    else
        break
    fi
done
