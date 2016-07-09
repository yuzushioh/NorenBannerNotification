//
//  NorenView+Ex.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import UIKit

public extension NorenView {
    
    public func onTap(onTap: (Void -> Void)) -> NorenView {
        self.addSingleTapGestureRecognizerWithResponder { gesture in
            self.dismiss(onTap)
        }
        
        return self
    }
    
    public func onTapDismiss() -> NorenView {
        self.addSingleTapGestureRecognizerWithResponder { tap in
            self.dismiss()
        }
        
        return self
    }
    
    public func onSwipeUpDismiss() -> NorenView {
        self.addSwipeUpGestureRecognizerWithResponder { swipe in
            self.dismiss()
        }
        
        return self
    }
    
    public func show(duration duration: NSTimeInterval) {
        self.present(duration)
    }
}
