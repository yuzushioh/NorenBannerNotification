//
//  UIImage+Extension.swift
//  Noren
//
//  Created by mercari on 6/6/16.
//  Copyright © 2016 yuzushioh. All rights reserved.
//

import Foundation
import UIKit

public extension UIImageView {
    public func fromUrl(url: String) {
        guard let url = NSURL(string: url) else { return }
        
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            guard
                let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
                let data = data where error == nil,
                let image = UIImage(data: data) else { return }
            
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.image = image
            }
        }.resume()
    }
}