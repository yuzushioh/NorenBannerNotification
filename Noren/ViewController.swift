//
//  ViewController.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showNoren() {
        
        let testView = TestView.createTestView()
        let norenView = NorenManager.createNorenView(testView, norenInformation: NorenInformation(body: "ここに本文"))
        
        norenView
            .onTap {
                print("Tapped")
            }
            .show(duration: 2.0)
    }

    @IBAction func showNorenViewTapped(sender: AnyObject) {
        showNoren()
    }
}

