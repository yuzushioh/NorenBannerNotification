//
//  CircledImageView.swift
//  Noren
//
//  Created by 福田涼介 on 6/7/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

class CircledImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initialize()
    }
    
    private func initialize() {
        self.layer.cornerRadius = self.layer.bounds.width/2
        self.clipsToBounds = true
    }
}