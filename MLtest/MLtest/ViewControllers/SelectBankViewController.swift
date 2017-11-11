//
//  SelectBankViewController.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class SelectBankViewController: PaymentInfoItemTableViewController {
    
    // MARK: - Framework Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
 
        if let destination = segue.destination as? SelectInstallmentPlanViewController {
     
            if let info = self.paymentInfo, let selectedCell = sender as? PaymentInfoTableViewCell {
     
                info.bank = selectedCell.paymetInfoItem as? Bank
     
                destination.paymentInfo = info
            }
     
        }
    }

    // MARK: - Helper Methods
    
    override func loadData() {
        super.loadData()
        
        guard let info = self.paymentInfo else {
            return
        }
        
        MercadoPago.getBanks(withInfo: info) { dataResponse in
            guard (dataResponse.error == nil) else {
                print ("ERROR: \(dataResponse.error!)")
                return
            }
            
            if let response : JSON = dataResponse.value {
                
                for (_, bankJSON) : (String, JSON) in response {
                    let bank = Bank(withJSON: bankJSON)
                    self.paymentInfoItems?.append(bank)
                }
                
                self.tableView.reloadData()
            }
        }
    }
}
