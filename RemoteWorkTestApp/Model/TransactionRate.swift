//
//  TransactionRate.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import Foundation

struct TransactionRate {
    let from: String
    let to: String
    let rate: NSDecimalNumber
    
    init?(dictionary: Any) {
        guard let dictionary = dictionary as? [String: Any],
            let from = dictionary["from"] as? String,
            let to = dictionary["to"] as? String,
            let rate = dictionary["rate"] as? String else {
                return nil
        }
        self.from = from
        self.to = to
        self.rate = NSDecimalNumber.init(string: rate)
    }
}
