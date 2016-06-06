//
//  NorenViewType.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

protocol NorenViewType {
    var norenInfomation: NorenInformation { get }
    
    static func createNorenView<V: NorenViewType where V: UIView>(customView: V, noren: NorenInformation) -> V
}

extension NorenViewType where Self: UIView {
    func onTap<N: NorenViewType where N: UIView>() -> N {
        let noren = self as! N
        
        return noren
    }
    
    func displayTime<N: NorenViewType where N: UIView>() -> N {
        let noren = self as! N
        
        return noren
    }
}
