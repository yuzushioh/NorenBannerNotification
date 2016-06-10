//
//  UIVIew+Extension.swift
//  Noren
//
//  Created by 福田涼介 on 6/10/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    typealias TapResponseClosure = (tap: UITapGestureRecognizer) -> Void
    
    private struct ClosureStore {
        static var TapClosureStore: [UITapGestureRecognizer : TapResponseClosure] = [:]
    }
    
    func addSingleTapGestureRecognizerWithResponder(responder: TapResponseClosure) {
        self.addTapGestureRecognizerForNumberOfTaps(withResponder: responder)
    }
    
    private func addTapGestureRecognizerForNumberOfTaps(numberOfTaps: Int = 1, numberOfTouches: Int = 1, withResponder responder: TapResponseClosure) {
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = numberOfTaps
        tap.numberOfTouchesRequired = numberOfTouches
        tap.addTarget(self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tap)
        
        ClosureStore.TapClosureStore[tap] = responder
    }
    
    @objc private func handleTap(sender: UITapGestureRecognizer) {
        if let closureForTap = ClosureStore.TapClosureStore[sender] {
            closureForTap(tap: sender)
        }
    }
}