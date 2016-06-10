//
//  TestView.swift
//  Noren
//
//  Created by 福田涼介 on 6/7/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import UIKit

class TestView: UIView, NorenViewType {
    
    //Protocol
    var norenInfomation: NorenInformation?
    var onTap: (Void -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    func handleTapGesture(gesture: UITapGestureRecognizer) {
        onTap?()
    }
    
    class func createTestView() -> TestView {
        let notificationView = UINib(nibName: "TestView", bundle: nil)
            .instantiateWithOwner(nil, options: nil)
            .first as! TestView
        
        return notificationView
    }
}
