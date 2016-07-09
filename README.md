# NorenNotification
__NorenNotification__ is the all customisable and easy-to-setup in-app notification library for iOS developers and designers
who want to implement the best in-app notification in minutes.

![Instagram-Like Notification](http://i.imgur.com/5jlpTL0.png, "サンプル画像")
![Facebook-Like Notification](http://i.imgur.com/Mj5yHrU.png, "サンプル画像2")

## Requirements

- Swift 2.2+
- iOS 8.0+

##Installation
#### [Carthage](https://github.com/Carthage/Carthage)

- Insert `github "yuzushioh/Noren" ~> 1.1.2` to your Cartfile.
- Run `carthage update --platform iOS`.
- Link your app with `NorenNotification.framework`.

##How To Use
It is really easy to use! 3 steps and it's good to go :)
Samples are provided in a project!

1. Import NorenNotification
2. Create a class which inherits from NorenView, and nib file which will be displayed as BannerNotification

3. Instantiate it by calling 
```swift
  let bannerNotification = someClassYouCreated
                          .presentNorenViewWithText("text here will be displayed", nibName: "sample")
```
   You can set either 'onTap' or 'onTapDismiss' method to your view. At the end, you have to set 'show()' to display.
```swift
  bannerNotification 
      .onTap {
        //implement what you want to do when on tap here.
      }
      .onSwipeUpDismiss()
      .show(duration: 2.0)
```

##Pull Requests?
Absolutely!

##License
__NorenNotification__ is available under the MIT license. See LICENSE.txt for details.
