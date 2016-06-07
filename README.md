# NorenNotification
__NorenNotification__ is the all customisable and easy-to-setup in-app notification library for iOS developers and designers
who want to implement the best in-app notification in minutes.

## Requirements

- Swift 2.2+
- iOS 8.0+

##Installation
#### [Carthage](https://github.com/Carthage/Carthage)

- Insert `github "Ryochan/Noren" ~> 1.0.0` to your Cartfile.
- Run `carthage update`.
- Link your app with `NorenNotification.framework` in `Carthage/Checkouts`.

##How To Use
It is really easy to use! 3 steps and it's good to go :)

1. Import NorenNotification
2. Create a UIView which comfirms to the protocol `NorenViewType` and design it in any way you like

  __protocol NorenViewType has two properties__
  - `norenInformation`
  - `onTap`

3. Create a NorenView and define what you want to do when on tap and how long you want it to be displayed.
   You can set either 'onTap' or 'onTapDismiss' method to your view. At the end, you have to set 'show()' to display.
```swift
  let norenView = NorenManager.createNorenView(designedView, norenInformation: NorenInformation(body: "You have new messages"))
                                              //Your designed view comes here. *It has to comform to `NorenViewType`
  norenView 
      .onTap {
        //implement what you want to do when on tap here.
      }
      .show(duration: 2.0)
```

##Pull Requests?
Absolutely!

##License
__NorenNotification__ is available under the MIT license. See LICENSE.txt for details.
