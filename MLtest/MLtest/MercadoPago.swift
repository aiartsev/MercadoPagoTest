//
//  MercadoPago.swift
//  MLtest
//
//  Created by AleIartsev on 11/10/17.
//  Copyright © 2017 AleIartsev. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class MercadoPago {
    
    static let PUBLIC_KEY = "444a9ef5-8a6b-429f-abdf-587639155d88"
    
    static let BASE_URL = "https://api.mercadopago.com/v1/"
    static let PAY_METHODS_URI = "payment_methods"
    static let BANKS_URI = "card_issuers"
    static let INSTALLMENTS_URI = "installments"
    
    static let PARAMETER_PUBLIC_KEY = "public_key"
    static let PARAMETER_METHOD_ID = "payment_method_id"
    static let PARAMETER_AMOUNT = "amount"
    static let PARAMETER_BANK_ID = "issuer.id"
    
    static func getPaymentMethods(completionHandler: @escaping (DataResponse<JSON>) -> Void) {
        get(PAY_METHODS_URI, withParameters: [PARAMETER_PUBLIC_KEY: PUBLIC_KEY], completionHandler: completionHandler)
    }
    
    static func getBanks(withInfo info: PaymentInfo, completionHandler: @escaping (DataResponse<JSON>) -> Void) {
        let parameters = [
            PARAMETER_PUBLIC_KEY: PUBLIC_KEY,
            PARAMETER_METHOD_ID: info.method?.id ?? ""
        ]
        
        get("\(PAY_METHODS_URI)/\(BANKS_URI)", withParameters: parameters, completionHandler: completionHandler)
    }
    
    static func getInstallmentPlans(withInfo info: PaymentInfo, completionHandler: @escaping (DataResponse<JSON>) -> Void) {
        let parameters : Parameters = [
            PARAMETER_PUBLIC_KEY: PUBLIC_KEY,
            PARAMETER_METHOD_ID: info.method?.id ?? "",
            PARAMETER_AMOUNT: info.amount,
            PARAMETER_BANK_ID: info.bank?.id ?? ""
        ]
        
        get("\(PAY_METHODS_URI)/\(INSTALLMENTS_URI)", withParameters: parameters, completionHandler: completionHandler)
    }
    
    static func get(_ uri: String, withParameters parameters: Parameters?, completionHandler: @escaping (DataResponse<JSON>) -> Void) {
        let url = "\(BASE_URL)\(uri)"
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseSwiftyJSON { dataResponse in
                completionHandler(dataResponse)
        }

    }
}
