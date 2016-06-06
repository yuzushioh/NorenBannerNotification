//
//  Noren.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation

struct NorenInformation {
    let title: String?
    let username: String?
    let body: String
    let imageUrl: String?
    
    init(title: String? = nil, username: String? = nil, body: String, imageUrl: String? = nil) {
        self.title = title
        self.username = username
        self.body = body
        self.imageUrl = imageUrl
    }
}