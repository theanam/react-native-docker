# WIP: Docker image for building and running React Native Applications

> A better documentation will come really soon.

Docker Image for Building React Native Apps. 

### What's included:

React native, Create-React-Native-App, Android SKD, Gradle, Maven, Batteries

This container should run in any Unix/Unix Inspired system (Linux, Mac). Not tested on windows (you can let me know)
### How to use

In order to work efficiently, it is recommended to keep the container running while developing. So, you should start the container with interactive shell. 

Use the following command to start the container and land on the shell.

    docker run --rm -it -v `pwd`:/app --network host theanam/react-native bash

Or, you can create a shell alias because **TBH, the code is inhumanely hard to remember 😹**. Paste the following line at the end of your `.bashrc` or `.zshrc` file, close and open the terminal, You should be good to go (Assuming you already have docker installed).

    alias rn-docker-sh="docker run --rm -it -v `pwd`:/app --network host theanam/react-native bash"

The command should land you inside the container shell. You will find every tool you need inside that shell including Android tools, React native CLI, `create-react-native-app`, and all other small tools to work on react native. 

#### Using ADB

You can chose to mount USB device file as a bind mount for linux, But for mac and windows, you have to use remote ADB. To use host USB with ADB, **modify the command** like this (Should work on linux hosts) 

    docker run --rm -it -v `pwd`:/app -v --privileged -v /dev/bus/usb:/dev/bus/usb --network host theanam/react-native bash

For mac (and probably for windows, because I haven't tested), You need to follow some steps. 

Go to the developer settings of your phone, and enable wireless ADB debugging. Now your phone needs to be in the same wifi network. You also need to find the IP address of your device. You can find it from the wifi network settings.

once you get the IP address, you should be able to connect to the adb server using the command inside your running container:

    adb connect <phone-ip-address>

[This section needs better docs]
### How to use (Legacy, Still works, has some caveats): 

You can run most of the react native related commands without installing anything locally. You can even use it with CI/CD.

The container can be used with the full docker command but that will look ugly, so you might wanna consider making a alias. For example: if you are using bash: append the following with your .bashrc

    alias rndocker="docker run --rm -it -v `pwd`:/app -p 8081:8081 theanam/react-native"

now if you prefix `rndocker` before any react native command, it will work just fine. For example, to run the command `react-native init myproject` run the command `rndocker react-native init myproject` and it should work just fine.

The repository also contains all the build tools so you should be able to build apk too.

> Enjoy. While I work on a better documentation