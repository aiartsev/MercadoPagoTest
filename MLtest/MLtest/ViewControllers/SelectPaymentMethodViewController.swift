//
//  SelectPaymentMethodViewController.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import UIKit
import SwiftyJSON

class SelectPaymentMethodViewController: PaymentInfoItemTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let destination = segue.destination as? SelectBankViewController {
            
            if let info = self.paymentInfo, let selectedCell = sender as? PaymentInfoTableViewCell {
                
                info.method = selectedCell.paymetInfoItem as? PaymentMethod
                
                destination.paymentInfo = info
            }
            
        }
    }

    override func loadData() {
        super.loadData()
        
        MercadoPago.getPaymentMethods() { dataResponse in
            guard (dataResponse.error == nil) else {
                print ("ERROR: \(dataResponse.error!)")
                return
            }
            
            if let response : JSON = dataResponse.value {
                for (_, methodJSON) : (String, JSON) in response {
                    let method = PaymentMethod(withJSON: methodJSON)
                    self.paymentInfoItems?.append(method)
                }
                
                self.tableView.reloadData()
            }
        }
    }
}
