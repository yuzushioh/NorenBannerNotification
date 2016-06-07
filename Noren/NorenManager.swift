//
//  NorenManager.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

public class NorenManager {
    
    static public func createNorenView<V: NorenViewType>(customView: V, norenInformation: NorenInformation) -> V {
        var customView = customView
        customView.norenInfomation = norenInformation
        
        return customView
    }
    
    static public func showNorenView<V: UIView where V: NorenViewType>(norenView: V, duration: NSTimeInterval) {
        dispatch_async(dispatch_get_main_queue()) {
            if self.isNorenViewShown() == true {
                self.dismissNorenView({
                    self.displayNorenView(norenView, duration: duration)
                    }, duration: duration)
            } else {
                self.displayNorenView(norenView, duration: duration)
            }
        }
    }
    
    static public func dismissNorenView(dismissHandler: NorenOperationHandler? = nil, duration: NSTimeInterval) {
        guard let activeNorenView = self.activeNorenView else { return }
        let offScreenPoint = CGPoint(x: activeNorenView.center.x, y: -activeNorenView.frame.height/2)
        
        UIView.animateWithDuration(animationDuration) {
            activeNorenView.center = offScreenPoint
        }
        
        UIApplication.sharedApplication().delegate?.window??.windowLevel = UIWindowLevelNormal
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue(), {
            activeNorenView.removeFromSuperview()
            
            if self.activeNorenView == activeNorenView {
                self.activeNorenView = nil
            }
            
            dismissHandler?()
        })
    }
    
    static private var activeNorenView: UIView?
    
    static private let animationDuration = 0.3
    
    static private func isNorenViewShown() -> Bool {
        return activeNorenView != nil
    }
    
    static private func dismissCurrentNorenView(dismissHandler: NorenOperationHandler?, duration: NSTimeInterval) {
        if isNorenViewShown() {
            dismissNorenView({ _ in
                dismissHandler?()
                }, duration: duration)
        }
    }
    
    static private func displayNorenView<V: UIView where V: NorenViewType>(norenView: V, duration: NSTimeInterval) {
        self.activeNorenView = norenView
        
        guard let mainWindow = UIApplication.sharedApplication().keyWindow else { return }
        norenView.frame = CGRect(x: 0, y: -norenView.frame.height, width: mainWindow.frame.width, height: norenView.frame.height)
        
        mainWindow.windowLevel = UIWindowLevelStatusBar
        mainWindow.addSubview(norenView)
        mainWindow.bringSubviewToFront(norenView)
        
        let y: CGFloat = norenView.frame.height/2.0
        let toPoint = CGPointMake(norenView.center.x, y)
        
        UIView.animateWithDuration(
            animationDuration,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: [.CurveEaseInOut, .BeginFromCurrentState, .AllowUserInteraction],
            animations: {
                norenView.center = toPoint
            },
            completion: nil)
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(duration * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue(), {
            self.dismissNorenView(nil, duration: duration)
        })

    }
}
