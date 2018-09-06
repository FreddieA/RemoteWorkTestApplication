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
    
    public static func convertValue(rateValue: NSDecimalNumber, rateTuple: (String, String), using rates: [TransactionRate]) -> NSDecimalNumber? {
        guard rateTuple.0 != rateTuple.1 else {
            return rateValue
        }
        if let rate = (rates.filter { return $0.from == rateTuple.0 && $0.to == rateTuple.1 }).first {
            return rateValue.multiplying(by: rate.rate, withBehavior: TransactionRate.decimalBehaviour)
        }
        guard let nextRate = (rates.filter { return $0.from == rateTuple.0 }).first else {
            return nil
        }
        let nextValue = rateValue.multiplying(by: nextRate.rate, withBehavior: TransactionRate.decimalBehaviour)
        return convertValue(rateValue: nextValue, rateTuple: (nextRate.to, rateTuple.1), using: rates)
    }
    
    static var decimalBehaviour: NSDecimalNumberBehaviors = {
    let handler = NSDecimalNumberHandler(roundingMode: .bankers,
                                         scale: 2,
                                         raiseOnExactness: false,
                                         raiseOnOverflow: false,
                                         raiseOnUnderflow: false,
                                         raiseOnDivideByZero: false)
        return handler
    }()
}
