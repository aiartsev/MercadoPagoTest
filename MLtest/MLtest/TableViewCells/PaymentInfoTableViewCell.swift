//
//  PaymentInfoTableViewCell.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import UIKit

class PaymentInfoTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: - Fields
    
    var paymetInfoItem: PaymentInfoItem?
}
