//
//  NorenViewType.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

typealias NorenOperationHandler = (Void -> Void)

protocol NorenViewType {
    var norenInfomation: NorenInformation? { get set }
    var onTap: NorenOperationHandler? { get set }
}

extension NorenViewType where Self: UIView {
    func onTap(onTap: NorenOperationHandler) -> Self {
        var noren = self
        
        noren.onTap = {
            NorenManager.dismissNorenView({ _ in
                    onTap()
                }, duration: 1.0)
        }
        
        return noren
    }
    
    func onTapDismiss() -> Self {
        var noren = self
        
        noren.onTap = {
            NorenManager.dismissNorenView(duration: 1.0)
        }
        
        return noren
    }
    
    func show(duration duration: NSTimeInterval) {
        let noren = self
        
        NorenManager.showNorenView(noren, duration: duration)
    }
}
