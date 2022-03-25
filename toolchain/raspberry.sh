## Swift an Git are existing in RapberryPi 64bit OS
#
## Install Swift
# @see https://swift-arm.com/installSwift
sudo apt update && sudo apt upgrade
sudo apt install curl

# solution 1
curl -s https://archive.swiftlang.xyz/install.sh | sudo bash
sudo apt install swiftlang

#solution 2
curl -s https://packagecloud.io/install/repositories/swift-arm/release/script.deb.sh | sudo bash

# check swift tripple
swiftc -print-target-info

### Install Git
# sudo apt install git


### EOF
