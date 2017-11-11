//
//  SelectInstallmentPlanViewController.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class SelectInstallmentPlanViewController: PaymentInfoItemTableViewController {
    
    // MARK: - Constants
    
    let JSON_COSTS = "payer_costs"
    
    // MARK: - Framework Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewController Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "PaymentInfoComplete", sender: tableView.cellForRow(at: indexPath))
    }

    // MARK: - Helper Methods
    
    override func loadData() {
        super.loadData()
        
        guard let info = self.paymentInfo else {
            return
        }
        
        MercadoPago.getInstallmentPlans(withInfo: info) { dataResponse in
            guard (dataResponse.error == nil) else {
                print ("ERROR: \(dataResponse.error!)")
                return
            }
            
            if let response : JSON = dataResponse.value {
                
                let onlyResponse = response[0]//[self.JSON_COSTS]
                let costs = onlyResponse[self.JSON_COSTS]
                
                for (_, json) : (String, JSON) in costs {
                    let plan = InstallmentPlan(withJSON: json)
                    self.paymentInfoItems?.append(plan)
                }
                
                self.tableView.reloadData()
            }
        }
    }
    
    override func configureCell(_ cell: PaymentInfoTableViewCell, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        if let infoItems = paymentInfoItems, let plan = infoItems[indexPath.row] as? InstallmentPlan  {
            cell.infoLabel.text = plan.recommendedMessage
        }
        
        return cell
    }

    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? AmountEntryViewController {
            
            if let info = self.paymentInfo, let selectedCell = sender as? PaymentInfoTableViewCell {
                
                info.plan = selectedCell.paymetInfoItem as? InstallmentPlan
                
                destination.paymentInfo = info
            }
            
        }
    }

}
