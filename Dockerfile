##
# FeedTheBeast Adaptable Docker Image
##

FROM openjdk:8-jdk-alpine
MAINTAINER SparksD2145 <SparksD2145@github>

# Minecraft Options
ENV MC_EULA false
ENV MC_SPAWN_PROTECTION 16
ENV MC_MAX_TICK_TIME 60000
ENV MC_GENERATOR_SETTINGS ""
ENV MC_GAMEMODE 0
ENV MC_FORCE_GAMEMODE false
ENV MC_HARDCORE false
ENV MC_ALLOW_NETHER true
ENV MC_ENABLE_QUERY false
ENV MC_PLAYER_IDLE_TIMEOUT 0
ENV MC_DIFFICULTY 1
ENV MC_SPAWN_ANIMALS true
ENV MC_SPAWN_NPCS true
ENV MC_SPAWN_MONSTERS true
ENV MC_GENERATE_STRUCTURES true
ENV MC_OPS_PERMISSION_LEVEL 4
ENV MC_OPS_BROADCAST_CONSOLE true
ENV MC_ANNOUNCE_PLAYER_ACHIEVEMENTS true
ENV MC_PVP true
ENV MC_SNOOPER_ENABLED true
ENV MC_LEVEL_TYPE BIOMESOP
ENV MC_COMMAND_BLOCK_ENABLED true
ENV MC_MAX_PLAYERS 20
ENV MC_NETWORK_COMPRESSION_THRESHOLD 256
ENV MC_MAX_WORLD_SIZE 29999984
ENV MC_SERVER_IP ""
ENV MC_SERVER_PORT 25565
ENV MC_ALLOW_FLIGHT true
ENV MC_WORLD_NAME world
ENV MC_VIEW_DISTANCE 10
ENV MC_RESOURCE_PACK ""
ENV MC_RESOURCE_PACK_SHA1 ""
ENV MC_WHITELIST false
ENV MC_ONLINE_MODE true
ENV MC_MAX_BUILD_HEIGHT 256
ENV MC_LEVEL_SEED ""
ENV MC_USE_NATIVE_TRANSPORT true
ENV MC_MOTD "Feed the Beast"
ENV MC_ENABLE_RCON false

# Add wget to system
RUN apk add --no-cache wget bash

# Add init script
ADD initialize.sh /usr/bin/initialize
RUN chmod a+x /usr/bin/initialize

# Add minecraft code
ADD ./ftb /usr/src/minecraft
ADD ./initialize.serverprops.sh /usr/src/minecraft
WORKDIR /usr/src/minecraft
RUN chmod +x *.sh

# Install FTB
RUN ./FTBInstall.sh

# Add volume for minecraft.
VOLUME /var/minecraft

# Set working directory.
WORKDIR /var/minecraft

# Expose Port
EXPOSE 25565

CMD /usr/bin/initialize
