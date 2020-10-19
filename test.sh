#!/bin/sh

# If your XCode setup is borked, you can reconfigure your cli by doing
# 
# sudo xcode-select -switch /pathtoxcode/Xcode.app/Contents/Developer/ 

xcodebuild test -scheme "Adhese SDK Tests" -project ./Adhese\ SDK.xcodeproj -destination 'platform=iOS Simulator,name=iPhone 8'
