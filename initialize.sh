#!/bin/bash
# FTB/Minecraft init script

# Copy server source to working directory.
if [ ! -e ./version.json ]; then
	cp -R /usr/src/minecraft/* .
fi

# Set up server.properties
if [ ! -e ./server.properties ]; then
	./scripts/serverprops.sh
fi

# Sign the EULA
echo "eula=$MC_EULA" > ./eula.txt

# Start server.
if [ -e ./ServerStart.sh ]; then
	./ServerStart.sh
elif [ -e ./minecraft_server.jar ] && [ ! -e ./FTBInstall.sh ]; then
	java -Xmx2048M -Xms2048M -jar minecraft_server.jar nogui
else
	echo "This image is missing minecraft server files."
fi
