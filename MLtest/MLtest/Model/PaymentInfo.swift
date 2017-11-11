//
//  PaymentInfo.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import Foundation

class PaymentInfo {
    var Amount: Double
    var Method: PaymentMethod?
    
    init(withAmount amount: Double) {
        Amount = amount
    }
}
