//
//  NorenManager.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

public final class NorenManager {
    
    static private var activeNorenView: UIView?
    
    static private let animationDuration = 0.3
    
    static public func createNorenView<V: NorenViewType>(customView: V, norenInformation: NorenInformation) -> V {
        let customView = customView
        customView.norenInfomation = norenInformation
        
        return customView
    }
    
    static public func showNorenView<V: UIView where V: NorenViewType>(norenView: V, duration: NSTimeInterval) {
        if activeNorenView != nil {
            dismissNorenView(
                {
                    displayNorenView(norenView, duration: duration)
                }
            )
        } else {
            displayNorenView(norenView, duration: duration)
        }
    }
    
    static public func dismissNorenView(dismissHandler: (Void -> Void)? = nil) {
        guard let norenView = activeNorenView else { return }
        let offScreenPoint = CGPoint(x: norenView.center.x, y: -norenView.frame.height/2)
        
        UIView.animateWithDuration(
            animationDuration,
            animations: {
                norenView.center = offScreenPoint
            },
            completion: { completed in
                norenView.removeFromSuperview()
                
                if self.activeNorenView == norenView {
                    self.activeNorenView = nil
                }
                
                dismissHandler?()
            }
        )
        
        UIApplication.sharedApplication().delegate?.window??.windowLevel = UIWindowLevelNormal
    }
    
    static private func isNorenViewShown() -> Bool {
        return activeNorenView != nil
    }
    
    static private func dismissCurrentNorenView(dismissHandler: (Void -> Void)?, duration: NSTimeInterval) {
        dismissNorenView(
            { _ in
                dismissHandler?()
            }
        )
    }
    
    static private func displayNorenView<V: UIView where V: NorenViewType>(norenView: V, duration: NSTimeInterval) {
        activeNorenView = norenView
        
        guard let window = UIApplication.sharedApplication().delegate?.window, mainWindow = window else { return }
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
        dispatch_after(delayTime, dispatch_get_main_queue(), { _ in
            dismissNorenView()
        })

    }
}
