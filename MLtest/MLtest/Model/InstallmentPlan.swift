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
    
    // MARK: - Constants
    
    let JSON_MESSAGE = "recommended_message"
    
    // MARK: - Fields
    
    var recommendedMessage: String?
    
    // MARK: - Constructor
    
    override init(withJSON json: JSON) {
        super.init(withJSON: json)
        
        recommendedMessage = json[JSON_MESSAGE].stringValue
    }
}
