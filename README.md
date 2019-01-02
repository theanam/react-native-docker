# WIP: Docker image for building and running React Native Applications

> A better documentation will come really soon.

Docker Image for Building React Native Apps.

### What's included:

React native, Create-React-Native-App, Android SKD, Gradle, Maven, Batteries

This container should run in any Unix/Unix Inspired system (Linux, Mac). Not tested on windows (you can let me know)

### How to use:

You can run most of the react native related commands without installing anything locally. You can even use it with CI/CD.

The container can be used with the full docker command but that will look ugly, so you might wanna consider making a alias. For example: if you are using bash: append the following with your .bashrc

    alias rndocker="docker run --rm -it -v `pwd`:/app -p 8081:8081 theanam/react-native"

now if you prefix `rndocker` before any react native command, it will work just fine. For example, to run the command `react-native init myproject` run the command `rndocker react-native init myproject` and it should work just fine.

The repository also contains all the build tools so you should be able to build apk too.

> Enjoy. While I work on a better documentation

## TODO

Use no root use on android-sdk folder
