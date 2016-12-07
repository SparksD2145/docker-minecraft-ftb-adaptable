Minecraft/FeedTheBeast for Docker
=================================

A dependable, reusable template for building vanilla minecraft and feed-the-beast server docker images.

## Building Vanilla Minecraft
Begin by cloning my repository:

```bash
git clone git@github.com:SparksD2145/docker-minecraft-ftb-adaptable.git
```

Download the latest minecraft_server.jar and rename it to `minecraft_server.jar`. Copy and paste the server jar into the server-files directory. Then, build your image:

```bash
sudo docker build -t my_minecraft_image .
```

Once the image is built, you can run it with:

```bash
sudo docker run -it --name my_minecraft_server --expose 25565 -env MC_EULA=true my_minecraft_image
```

With this command, the server will start and you will be dropped into the server's interactive console. Notice that you are accepting the minecraft EULA while starting your server.


## Building Feed The Beast / Other Flavors of Minecraft
Creating an image for feed-the-beast is much the same. Begin by cloning my repository:

```bash
git clone git@github.com:SparksD2145/docker-minecraft-ftb-adaptable.git
```

Download your desired [FeedTheBeast Server zip file][ftb-servers]. Extract the zip file's contents into the server-files directory. Then, build your image:

```bash
sudo docker build -t my_ftb_image .
```

Once the image is built, you can run it with:

```bash
sudo docker run -it --name my_ftb_server --expose 25565 -env MC_EULA=true my_ftb_image
```

With this command, the server will start and you will be dropped into the server's interactive console. Again, notice that you are accepting the minecraft EULA while starting your server.

## License
You are free to adopt and expand upon my code per the included MIT license.




[ftb-servers]: http://legacy.feed-the-beast.com/server-downloads
