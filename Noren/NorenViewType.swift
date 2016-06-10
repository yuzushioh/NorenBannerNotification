//
//  NorenViewType.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

public protocol NorenViewType: class {
    var norenInfomation: NorenInformation? { get set }
}

public extension NorenViewType where Self: UIView {
    
    public func onTap(onTap: (Void -> Void)) -> Self {
        let noren = self
        
        noren.addSingleTapGestureRecognizerWithResponder({ gesture in
            NorenManager.dismissNorenView({ onTap() })
        })
        
        return noren
    }
    
    public func onTapDismiss() -> Self {
        let noren = self
        
        noren.addSingleTapGestureRecognizerWithResponder { (tap) in
            print("TapGesture Detected")
            NorenManager.dismissNorenView()
        }
        
        return noren
    }
    
    public func onSwipeUpDismiss() -> Self {
        let noren = self
        
        noren.addSwipeUpGestureRecognizerWithResponder { (swipe) in
            print("SwipeGesture Detected")
            NorenManager.dismissNorenView()
        }
        
        return noren
    }
    
    public func show(duration duration: NSTimeInterval) {
        let noren = self
        
        NorenManager.showNorenView(noren, duration: duration)
    }
}
