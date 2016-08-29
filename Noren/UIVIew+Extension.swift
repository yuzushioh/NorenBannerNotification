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
    
    public typealias TapResponseClosure = (tap: UITapGestureRecognizer) -> Void
    public typealias SwipeResponseClosure = (swipe: UISwipeGestureRecognizer) -> Void
    
    public struct ClosureStore {
        public static var TapClosureStore: [UITapGestureRecognizer : TapResponseClosure] = [:]
        public static var SwipeClosureStore: [UISwipeGestureRecognizer : SwipeResponseClosure] = [:]
    }
    
    public func addSingleTapGestureRecognizerWithResponder(responder: TapResponseClosure) {
        addTapGestureRecognizerForNumberOfTaps(withResponder: responder)
    }
    
    public func addTapGestureRecognizerForNumberOfTaps(numberOfTaps: Int = 1, numberOfTouches: Int = 1, withResponder responder: TapResponseClosure) {
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = numberOfTaps
        tap.numberOfTouchesRequired = numberOfTouches
        tap.addTarget(self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tap)
        
        ClosureStore.TapClosureStore[tap] = responder
    }
    
    @objc public func handleTap(sender: UITapGestureRecognizer) {
        if let closureForTap = ClosureStore.TapClosureStore[sender] {
            closureForTap(tap: sender)
        }
    }
    
    public func addSwipeUpGestureRecognizerWithResponder(responder: SwipeResponseClosure) {
        addSwipeGestureRecognizerForNumberOfTouches(forSwipeDirection: .Up, withResponder: responder)
    }
    
    public func addSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: Int = 1, forSwipeDirection swipeDirection: UISwipeGestureRecognizerDirection, withResponder responder: SwipeResponseClosure) {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = swipeDirection
        swipe.numberOfTouchesRequired = numberOfTouches
        swipe.addTarget(self, action: #selector(handleSwipe(_:)))
        addGestureRecognizer(swipe)
        
        ClosureStore.SwipeClosureStore[swipe] = responder
    }
    
    @objc public func handleSwipe(sender: UISwipeGestureRecognizer) {
        if let closureForSwipe = ClosureStore.SwipeClosureStore[sender] {
            closureForSwipe(swipe: sender)
        }
    }
}