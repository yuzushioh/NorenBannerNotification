//
//  TestView.swift
//  Noren
//
//  Created by 福田涼介 on 6/7/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import UIKit

class TestView: NorenView {
    
    @IBOutlet weak var bodyTextLabel: UILabel!
    
    override var bodyText: String? {
        didSet {
            bodyTextLabel.text = bodyText
        }
    }
}
