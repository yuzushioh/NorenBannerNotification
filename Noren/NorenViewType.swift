//
//  NorenViewType.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

protocol NorenViewType {
    var title: String? { get }
    var username: String? { get }
    var body: String { get }
    var imageUrl: String? { get }
    
    func createNorenView(customView: UIView) -> UIView
}