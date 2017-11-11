//
//  SelectPaymentMethodViewController.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import UIKit
import SwiftyJSON

class SelectPaymentMethodViewController: UITableViewController {

    var paymentInfo: PaymentInfo?
    var paymentMethods : [PaymentMethod]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        
        MercadoPago.getPaymentMethods() { dataResponse in
            guard (dataResponse.error == nil) else {
                print ("ERROR: \(dataResponse.error!)")
                return
            }
            
            if let response : JSON = dataResponse.value {
                self.paymentMethods = [PaymentMethod]()
                
                for (_, methodJSON) : (String, JSON) in response {
                    let method = PaymentMethod(withJSON: methodJSON)
                    self.paymentMethods?.append(method)
                }
                
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let methods = paymentMethods {
            return methods.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodCell", for: indexPath) as? PaymentMethodTableViewCell else {
            fatalError("SelectPaymentMethodViewController ERROR: Somehow cell not of PaymentMethodTableViewCell class")
        }
        
        if let methods = paymentMethods {
            let method = methods[indexPath.row]
            cell.MethodNameLabel.text = method.name
            cell.MethodImageView.imageFromUrl(urlString: method.imageURL)
            cell.MethodImageView.contentMode = .scaleAspectFit
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let destination = segue.destination as? SelectBankViewController {
            
        }
    }

}
