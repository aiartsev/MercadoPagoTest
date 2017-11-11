//
//  InstallmentPlan.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import Foundation
import SwiftyJSON

class InstallmentPlan : PaymentInfoItem {
    let JSON_MESSAGE = "recommended_message"
    
    var recommendedMessage: String?
    
    override init(withJSON json: JSON) {
        super.init(withJSON: json)
        
        recommendedMessage = json[JSON_MESSAGE].stringValue
    }
}
