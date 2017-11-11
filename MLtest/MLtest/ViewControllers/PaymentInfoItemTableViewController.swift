//
//  PaymentInfoItemTableViewController.swift
//  MLtest
//
//  Created by AleIartsev on 11/11/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import UIKit

class PaymentInfoItemTableViewController: UITableViewController {

    // MARK: - Fields
    
    var paymentInfo: PaymentInfo?
    var paymentInfoItems : [PaymentInfoItem]?
    
    // MARK: - Framework Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewController Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let infoItems = paymentInfoItems {
            return infoItems.count
        }
        
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentInfoCell", for: indexPath) as? PaymentInfoTableViewCell else {
            fatalError("SelectPaymentMethodViewController ERROR: Somehow cell not of PaymentIfoTableViewCell class")
        }

        if let infoItems = self.paymentInfoItems {
            cell.paymetInfoItem = infoItems[indexPath.row]
        }
        
        return configureCell(cell, forIndexPath: indexPath)
    }
    
    // MARK: - Helper Methods
    
    func loadData() {
        self.paymentInfoItems = [PaymentInfoItem]()
    }
    
    func configureCell(_ cell: PaymentInfoTableViewCell, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        if let infoItems = paymentInfoItems {
            let infoItem = infoItems[indexPath.row]
            cell.infoLabel.text = infoItem.name
            if let url = infoItem.imageURL {
                cell.infoImageView.imageFromUrl(urlString: url)
                cell.infoImageView.contentMode = .scaleAspectFit
            }
        }
        
        return cell
    }
}
