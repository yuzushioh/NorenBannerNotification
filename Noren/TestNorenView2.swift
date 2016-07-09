//
//  TestNorenView2.swift
//  Noren
//
//  Created by 福田涼介 on 6/7/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import UIKit

class TestNorenView2: NorenView {
    
    @IBOutlet weak var underBar: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        underBar.layer.cornerRadius = 4
        underBar.clipsToBounds = true
    }
}