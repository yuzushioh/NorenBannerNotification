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
    typealias SwipeResponseClosure = (swipe: UISwipeGestureRecognizer) -> Void
    
    private struct ClosureStore {
        static var TapClosureStore: [UITapGestureRecognizer : TapResponseClosure] = [:]
        static var SwipeClosureStorage: [UISwipeGestureRecognizer : SwipeResponseClosure] = [:]
    }
    
    public func addSingleTapGestureRecognizerWithResponder(responder: TapResponseClosure) {
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
    
    public func addSwipeUpGestureRecognizerWithResponder(responder: SwipeResponseClosure) {
        self.addSwipeUpGestureRecognizerForNumberOfTouches(withResponder: responder)
    }
    
    private func addSwipeUpGestureRecognizerForNumberOfTouches(numberOfTouches: Int = 1, withResponder responder: SwipeResponseClosure) {
        self.addSwipeGestureRecognizerForNumberOfTouches(numberOfTouches, forSwipeDirection: .Up, withResponder: responder)
    }
    
    private func addSwipeGestureRecognizerForNumberOfTouches(numberOfTouches: Int, forSwipeDirection swipeDirection: UISwipeGestureRecognizerDirection, withResponder responder: SwipeResponseClosure) {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = swipeDirection
        swipe.numberOfTouchesRequired = numberOfTouches
        swipe.addTarget(self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(swipe)
        
        ClosureStore.SwipeClosureStorage[swipe] = responder
    }
    
    @objc private func handleSwipe(sender: UISwipeGestureRecognizer) {
        if let closureForSwipe = ClosureStore.SwipeClosureStorage[sender] {
            closureForSwipe(swipe: sender)
        }
    }
}