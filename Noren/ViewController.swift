//
//  ViewController.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showNorenViewTapped(sender: AnyObject) {
        let testView = TestView.presentNorenViewWithText("Thank you for checking Noren", nibName: "TestView")
        
        testView
            .onTap {
                print("Tap detected")
            }
            .onSwipeUpDismiss()
            .show(duration: 3.0)
    }
    
    @IBAction func showFacebookLikeView(sender: AnyObject) {
        let testView = TestNorenView2.presentNorenViewWithText("Thank you for checking Noren", nibName: "TestNorenView2")
        
        testView
            .onTapDismiss()
            .onSwipeUpDismiss()
            .show(duration: 2.0)
    }
}

