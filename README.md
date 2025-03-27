# Demo shop created on the basis of PersonaClick- IOS SDK

[![Version](https://img.shields.io/cocoapods/v/PersonaClick.svg?style=flat)](https://cocoapods.org/pods/PersonaClick)
![iOS](https://img.shields.io/badge/iOS-13%2B-blue)
![Release](https://img.shields.io/badge/release-blueviolet)
[![License](https://img.shields.io/cocoapods/l/PersonaClick.svg?style=flat)](https://cocoapods.org/pods/PersonaClick)

![PersonaClick](https://github.com/user-attachments/assets/f84f80c5-5884-42f5-92d5-65f2a4c30aee)

## Description

This demo application was developed using the PersonaClick SDK for iOS to showcase the capabilities of this SDK.

## Version

Current app version: 1.0.0

## Deployment Target

This SDK requires iOS 13.0 or later.

## Video and Screenshots

### Video
[Watch Demo Video](https://github.com/user-attachments/assets/8c5bcb21-306b-4613-acde-9089cf176954)


## Code Example

Here's a simple example to get you started:

```swift
import PersonaClick

class SDKManager: SDKManaging {
    var sdk: PersonalizationSDK?

    init() {
        initializeSDK()
    }

    private func initializeSDK() {
        sdk = createPersonalizationSDK(
            shopId: "YOUR_SHOP_ID",
            apiDomain: "YOUR_DOMAIN"
        )
    }
}
