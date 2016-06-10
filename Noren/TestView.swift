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
    
    class func createTestView() -> TestView {
        let notificationView = UINib(nibName: "TestView", bundle: nil)
            .instantiateWithOwner(nil, options: nil)
            .first as! TestView
        
        return notificationView
    }
}
