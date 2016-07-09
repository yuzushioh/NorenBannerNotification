//
//  NorenView.swift
//  Noren
//
//  Created by 福田涼介 on 7/9/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import UIKit
import AudioToolbox

public class NorenView: UIWindow {
    
    public var bodyText: String?
    
    private static var activeNorenWindoww: UIWindow?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        windowLevel = UIWindowLevelStatusBar
    }
    
    public func present(duration: NSTimeInterval) {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        NorenView.activeNorenWindoww = self
        
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
                    self?.dismiss()
                })
            }
        )
    }
    
    public func dismiss(onTap: (Void -> Void)? = nil) {
        animate(
            animations: {
                self.frame.origin.y = -self.frame.size.height
                self.layoutIfNeeded()
            },
            completion: { finished in
                if NorenView.activeNorenWindoww == self {
                    NorenView.activeNorenWindoww = nil
                }
                
                onTap?()
            }
        )
    }
    
    private func animate(animations animations: Void -> Void, completion: (Bool -> Void)) {
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
    
    public static func presentNorenViewWithText(text: String, nibName: String) -> NorenView {
        let notificationView = UINib(nibName: nibName, bundle: nil)
            .instantiateWithOwner(nil, options: nil)
            .first as! NorenView
        
        notificationView.bodyText = text
        
        return notificationView
    }
}
