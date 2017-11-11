//
//  PaymentInfo.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import Foundation

class PaymentInfo {
    
    // MARK: - Fields
    
    var amount: Double
    var method: PaymentMethod?
    var bank: Bank?
    var plan: InstallmentPlan?
    
    // MARK: - Constructor
    
    init(withAmount amount: Double) {
        
        self.amount = amount
    }
}
