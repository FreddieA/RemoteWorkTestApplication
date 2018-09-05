//
//  Transaction.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import Foundation

struct Transaction {
    let amount: NSDecimalNumber
    let currency: String
    let productSku: String
    
    init?(dictionary: Any) {
        guard let dictionary = dictionary as? [String: Any],
            let amount = dictionary["amount"] as? String,
            let currency = dictionary["currency"] as? String,
            let productSku = dictionary["sku"] as? String else {
             return nil
        }
        self.amount = NSDecimalNumber.init(string: amount)
        self.currency = currency
        self.productSku = productSku
    }
}
