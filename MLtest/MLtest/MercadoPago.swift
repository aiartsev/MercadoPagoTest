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
    
    static func getPaymentMethods(completionHandler: @escaping (DataResponse<JSON>) -> Void) {
        get(PAY_METHODS_URI, withParameters: ["public_key": PUBLIC_KEY], completionHandler: completionHandler)
    }
    
    static func get(_ uri: String, withParameters parameters: Parameters?, completionHandler: @escaping (DataResponse<JSON>) -> Void) {
        let url = "\(BASE_URL)\(uri)"
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseSwiftyJSON { dataResponse in
                completionHandler(dataResponse)
        }

    }
}
