#!/bin/bash
if [ ! -f "/app/config/IPC.config" ]; then
    echo '{"Kestrel":{"Endpoints":{"HTTP":{"Url":"http://*:1242"}}}}' >> /app/config/IPC.config
fi
if [ ! -f "/app/config/ASF.json" ]; then
    echo '{"IPCPassword":"asf123456","UpdateChannel": 0,"UpdatePeriod": 0,"Headless": true}' >> /app/config/ASF.json
fi
echo '127.0.0.1 steamcommunity.com www.steamcommunity.com store.steampowered.com api.steampowered.com github.com' >> /etc/hosts
chmod +x ./steamcommunity_302.caddy
chmod +x ./steamcommunity_302.cli
./steamcommunity_302.cli &
/asf/ArchiSteamFarm-Service.sh --no-restart --system-required