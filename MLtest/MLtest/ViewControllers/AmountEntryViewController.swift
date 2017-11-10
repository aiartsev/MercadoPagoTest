//
//  AmountEntryViewController.swift
//  MLtest
//
//  Created by AleIartsev on 11/10/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import UIKit

class AmountEntryViewController: ViewController, UITextFieldDelegate {
    
    @IBOutlet weak var amountEntryField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountEntryField.delegate = self
    }
   
    @IBAction func amountChanged(_ sender: UITextField) {
        if let amountString = sender.text?.currencyInputFormatting() {
            sender.text = amountString
        }
    }
    
}
