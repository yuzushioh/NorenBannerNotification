//
//  NorenView+Ex.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import UIKit
import AudioToolbox

public protocol NorenViewType: class {
    func dismiss(onTap: ((Void) -> Void)?)
    func animate(animations animations: Void -> Void, completion: (Bool -> Void))
    
    func onTap(onTap: ((Void) -> Void)) -> NorenViewType
    func onTapDismiss() -> NorenViewType
    func onSwipeUpDismiss() -> NorenViewType
    func show(duration duration: NSTimeInterval)
}

public extension NorenViewType where Self: UIWindow {
    public func onTap(onTap: ((Void) -> Void)) -> NorenViewType {
        addSingleTapGestureRecognizerWithResponder { gesture in
            self.dismiss(onTap)
        }
        
        return self
    }
    
    public func onTapDismiss() -> NorenViewType {
        addSingleTapGestureRecognizerWithResponder { tap in
            self.dismiss(nil)
        }
        
        return self
    }
    
    public func onSwipeUpDismiss() -> NorenViewType {
        addSwipeUpGestureRecognizerWithResponder { swipe in
            self.dismiss(nil)
        }
        
        return self
    }
    
    public func dismiss(onTap: ((Void) -> Void)?) {
        animate(
            animations: {
                self.frame.origin.y = -self.frame.size.height
                self.layoutIfNeeded()
            },
            completion: { finished in
                onTap?()
            }
        )
    }
    
    public func show(duration duration: NSTimeInterval) {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        frame.size.width = UIScreen.mainScreen().bounds.width
        frame.origin.y = -frame.size.height
        layoutIfNeeded()
        
        animate(
            animations: {
                self.frame.origin.y = 0
                self.layoutIfNeeded()
            },
            completion: { finished in
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(duration * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue(), { [weak self] _ in
                    self?.dismiss(nil)
                })
            }
        )
    }
    
    public func animate(animations animations: Void -> Void, completion: (Bool -> Void)) {
        UIView.animateWithDuration(
            0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: [.CurveEaseInOut, .BeginFromCurrentState, .AllowUserInteraction],
            animations: animations,
            completion: completion
        )
    }
}
