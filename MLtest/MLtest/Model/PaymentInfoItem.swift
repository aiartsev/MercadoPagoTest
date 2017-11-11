//
//  PaymentInfoItem.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import Foundation
import SwiftyJSON

class PaymentInfoItem {
    let JSON_ID = "id"
    let JSON_NAME = "name"
    let JSON_IMAGE = "secure_thumbnail"
    
    var Id: String
    var Name: String
    var ImageURL: String
    
    init(withJSON json: JSON) {
        Id = json[JSON_ID].stringValue
        Name = json[JSON_NAME].stringValue
        ImageURL = json[JSON_IMAGE].stringValue
    }
}
