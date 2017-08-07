# Devslopes RxSwift Course: Source Code #

![http://i.imgur.com/VOmzs4b.png](http://i.imgur.com/VOmzs4b.png)

This repository accompanies the RxSwift course from Devslopes available in the 'Learn to Code' app available on the iOS, macOS, and tvOS App Store.

[Devslopes: Learn to Code - https://itunes.apple.com/ca/app/devslopes-learn-programming-app-development/id1087131850?mt=8](https://itunes.apple.com/ca/app/devslopes-learn-programming-app-development/id1087131850?mt=8)

### Getting Started ###
This repository is intended for use by Devslopes students although it is available to the general public. These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisities ###

**1.)** Fork the repo (make sure this code remains private) and then clone that fork to your local machine.

**2.)** If CocoaPods is not installed on your local machine:

`sudo gem install cocoapods`

This will install cocoapods on your system. Once that is done, do:

`pod install`

To install the required dependencies for building the project.

**3.)** Open the project in Xcode.

**4.)** Click on the `Pods` project from the Project Navigator, select `AlamofireImage` from the list of Targets, and click on `Build Settings`. 

**5.)** Change the Swift Language Version to `Swift 3.2` from `Swift 4.0` for AlamofireImage. Once AlamofireImage has been updated to Swift 4, you won't need to worry about this.

### Installing ###

To install the app on a device for testing, simply connect your device, chose it in the device list in Xcode and click on Run.

### Who do I talk to? ###

If you have any questions, comments, concerns, or suggestions please reach out to [caleb@devslopes.com](mailto:caleb@devslopes.com)