//
//  AmountEntryViewController.swift
//  MLtest
//
//  Created by AleIartsev on 11/10/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import UIKit

class AmountEntryViewController: ViewController, UITextFieldDelegate {
    
    var paymentInfo: PaymentInfo?
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let destination = segue.destination as? SelectPaymentMethodViewController {
            var amountNumber: Double = 0
            
            if let text = amountEntryField.text {
                let amount = text
                    .replacingOccurrences(of: "$", with: "")
                    .replacingOccurrences(of: ",", with: "")
                    .replacingOccurrences(of: ".", with: "")
                
                amountNumber = (amount as NSString).doubleValue
            }
            
            self.paymentInfo = PaymentInfo(withAmount: amountNumber)
            destination.paymentInfo = self.paymentInfo
        }
    }
}
