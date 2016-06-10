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

- Insert `github "yuzushioh/Noren" ~> 1.1.1` to your Cartfile.
- Run `carthage update --platform iOS`.
- Link your app with `NorenNotification.framework`.

##How To Use
It is really easy to use! 3 steps and it's good to go :)

1. Import NorenNotification
2. Create a UIView which comfirms to the protocol `NorenViewType` and design it in any way you like

  __protocol NorenViewType has two properties__
  - `norenInformation`

3. Create a NorenView and define what you want to do when on tap and how long you want it to be displayed.
   You can set either 'onTap' or 'onTapDismiss' method to your view. At the end, you have to set 'show()' to display.
```swift
  let norenInformation = NorenInformation(body: "You have new messages")
  let norenView = NorenManager.createNorenView(designedView, norenInformation: norenInformation)
                                  //Your designed view comes here. *has to comform to `NorenViewType`
  norenView 
      .onTap {
        //implement what you want to do when on tap here.
      }
      .onSwipeUpDismiss()
      .show(duration: 2.0)
```

You can give as much detailed information as this to display on the NorenNotification view! Very Useful, Right?
```swift
struct NorenInformation {
    let title: String?
    let username: String?
    let body: String
    let imageUrl: String?
}
```

##Pull Requests?
Absolutely!

##License
__NorenNotification__ is available under the MIT license. See LICENSE.txt for details.
