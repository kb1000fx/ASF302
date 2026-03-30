#!/bin/bash
if [ ! -f "/app/config/IPC.config" ]; then
    echo '{"Kestrel":{"Endpoints":{"HTTP":{"Url":"http://*:1242"}}}}' >> /app/config/IPC.config
fi
if [ ! -f "/app/config/ASF.json" ]; then
    echo '{"IPCPassword":"asf123456","UpdateChannel": 0,"UpdatePeriod": 0,"Headless": true}' >> /app/config/ASF.json
fi
./steamcommunity_302.cli &
/asf/ArchiSteamFarm-Service.sh --no-restart --system-required