//
//  NorenViewType.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

public typealias NorenOperationHandler = (Void -> Void)

public protocol NorenViewType {
    var norenInfomation: NorenInformation? { get set }
    var onTap: NorenOperationHandler? { get set }
}

public extension NorenViewType where Self: UIView {
    
    public func onTap(onTap: NorenOperationHandler) -> Self {
        var noren = self
        noren.onTap = { NorenManager.dismissNorenView({ onTap() }, duration: 1.0) }
        
        return noren
    }
    
    public func onTapDismiss() -> Self {
        var noren = self
        noren.onTap = { NorenManager.dismissNorenView(duration: 1.0) }
        
        return noren
    }
    
    public func show(duration duration: NSTimeInterval) {
        let noren = self
        
        NorenManager.showNorenView(noren, duration: duration)
    }
}
