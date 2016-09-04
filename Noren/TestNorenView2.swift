//
//  TestNorenView2.swift
//  Noren
//
//  Created by 福田涼介 on 6/7/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import UIKit

class TestNorenView2: UIWindow, NorenViewType {
    
    @IBOutlet weak var underBar: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        underBar.layer.cornerRadius = 4
        underBar.clipsToBounds = true
    }
    
    static func presentNorenViewWithText(text: String, nibName: String) -> TestNorenView2 {
        let notificationView = UINib(nibName: nibName, bundle: nil)
            .instantiateWithOwner(nil, options: nil)
            .first as! TestNorenView2
        
        return notificationView
    }
}