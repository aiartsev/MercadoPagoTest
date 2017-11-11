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
    
    var id: String?
    var name: String?
    var imageURL: String?
    
    init(withJSON json: JSON) {
        id = json[JSON_ID].stringValue
        name = json[JSON_NAME].stringValue
        imageURL = json[JSON_IMAGE].stringValue
    }
}
