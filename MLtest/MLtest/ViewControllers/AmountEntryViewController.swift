//
//  AmountEntryViewController.swift
//  MLtest
//
//  Created by AleIartsev on 11/10/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import UIKit

class AmountEntryViewController: ViewController, UITextFieldDelegate {
    
    // MARK: - Fields
    
    var paymentInfo: PaymentInfo?
    var flowComplete = false
    
    // MARK: - Outlets
    
    @IBOutlet weak var amountEntryField: UITextField!
    
    // MARK: - Framework Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountEntryField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        displayMessage()
    }
   
    // MARK: - Actions
    
    @IBAction func amountChanged(_ sender: UITextField) {
        if let amountString = sender.text?.currencyInputFormatting() {
            sender.text = amountString.truncated(10)
        }
    }
    
    // MARK: - Navigation
    
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
            
            self.paymentInfo = PaymentInfo(withAmount: amountNumber / 100)
            destination.paymentInfo = self.paymentInfo
            
            amountEntryField.resignFirstResponder()
            amountEntryField.text = ""
        }
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        flowComplete = true
    }
    
    // MARK: - Helper Methods
    
    func displayMessage() {
        if (!flowComplete) {
            return
        }
        
        flowComplete = false
        
        guard let info = self.paymentInfo else {
            return
        }
        
        let amount = "\(info.amount * 100)".currencyInputFormatting()
        
        let alert = UIAlertController(title: "Payment Complete", message: "Se ha pagado \(amount) con la tarjeta \(info.method?.name ?? "") del banco \(info.bank?.name ?? "") y el plan de \(info.plan?.recommendedMessage ?? "")", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
