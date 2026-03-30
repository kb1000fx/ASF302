FROM ghcr.io/justarchinet/archisteamfarm:latest
ENV ASF_USER=asf
ENV ASPNETCORE_URLS=
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV DOTNET_NOLOGO=true

EXPOSE 1242
WORKDIR /app
COPY start.sh /app/
COPY Steamcommunity_302 /app/

HEALTHCHECK CMD ["pidof", "-q", "ArchiSteamFarm"]
ENTRYPOINT ["/bin/bash", "/app/start.sh"]