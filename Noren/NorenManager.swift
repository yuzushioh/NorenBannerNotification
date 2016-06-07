//
//  NorenManager.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

class NorenManager: NSObject {
    
    private var activeNorenView: UIView?
    
    static let sharedManager = NorenManager()
    
    func createNorenView<V: NorenViewType>(customView: V, norenInformation: NorenInformation) -> V {
        var customView = customView
        customView.norenInfomation = norenInformation
        
        return customView
    }
    
    func showNorenView<V: UIView where V: NorenViewType>(norenView: V, duration: NSTimeInterval) {
        dispatch_async(dispatch_get_main_queue()) { [weak self] in
            if self?.isNorenViewShown() == true {
                self?.dismissNorenView({ [weak self] _ in
                    self?.displayNorenView(norenView, duration: duration)
                    }, duration: duration)
            } else {
                self?.displayNorenView(norenView, duration: duration)
            }
        }
    }
    
    func dismissNorenView(dismissHandler: NorenOperationHandler? = nil, duration: NSTimeInterval) {
        guard let activeNorenView = self.activeNorenView else { return }
        let offScreenPoint = CGPoint(x: activeNorenView.center.x, y: -activeNorenView.frame.height/2)
        
        UIView.animateWithDuration(animationDuration) {
            activeNorenView.center = offScreenPoint
        }
        
        UIApplication.sharedApplication().delegate?.window??.windowLevel = UIWindowLevelNormal
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue(), { [weak self] () -> Void in
            activeNorenView.removeFromSuperview()
            
            if self?.activeNorenView == activeNorenView {
                self?.activeNorenView = nil
            }
            
            dismissHandler?()
        })
    }
    
    private let animationDuration = 0.3
    
    private func isNorenViewShown() -> Bool {
        return activeNorenView != nil
    }
    
    private func dismissCurrentNorenView(dismissHandler: NorenOperationHandler?, duration: NSTimeInterval) {
        if isNorenViewShown() {
            dismissNorenView({ _ in
                dismissHandler?()
                }, duration: duration)
        }
    }
    
    private func displayNorenView<V: UIView where V: NorenViewType>(norenView: V, duration: NSTimeInterval) {
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
        dispatch_after(delayTime, dispatch_get_main_queue(), { [weak self] () -> Void in
            self?.dismissNorenView(nil, duration: duration)
        })

    }
}
