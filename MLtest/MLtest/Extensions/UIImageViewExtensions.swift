//
//  UIImageViewExtensions.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    
    // Image loading from the URL using AlamofireImage
    public func imageFromUrl(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            Alamofire.request(url).responseImage {
                response in
                
                if let image = response.result.value {
                    self.image = image
                }
            }
        }
    }
    
}
