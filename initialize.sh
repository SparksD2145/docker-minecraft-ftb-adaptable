#!/bin/bash
# Direwolf Initialization Script.
set -e

# Copy Minecraft source to working directory.
if [ ! -e ./version.json ]; then
	cp -R /usr/src/minecraft/* .
fi

# Set up server.properties
if [ ! -e ./server.properties ]; then
	./initialize.serverprops.sh
fi

# Sign the EULA
echo "eula=$MC_EULA" > ./eula.txt

# Start Server
./ServerStart.sh
