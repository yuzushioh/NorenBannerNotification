//
//  TestView.swift
//  Noren
//
//  Created by 福田涼介 on 6/7/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import UIKit

class TestView: UIWindow, NorenViewType {
    
    @IBOutlet weak var bodyTextLabel: UILabel!
    
    static func presentNorenViewWithText(text: String, nibName: String) -> TestView {
        let notificationView = UINib(nibName: nibName, bundle: nil)
            .instantiateWithOwner(nil, options: nil)
            .first as! TestView
        
        notificationView.bodyTextLabel.text = text
        
        return notificationView
    }
}
