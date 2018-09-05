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
    
    init(rate: TransactionRate, targetRate: TransactionRate) {
        self.from = rate.from
        self.to = targetRate.to
        self.rate = rate.rate.multiplying(by: targetRate.rate)
    }
    
    static func convert(value: NSDecimalNumber, fromCurrency: String, toCurrency: String, fromArray: [TransactionRate]) -> NSDecimalNumber {
        guard fromCurrency != toCurrency else {
            return value
        }
        
        if let rate = (fromArray.filter { $0.from == fromCurrency && $0.to == toCurrency }).first {
            print("\(fromCurrency) -> \(toCurrency)")
            return value.multiplying(by: rate.rate)
        } else {
            
            if let rate = (fromArray.filter{ $0.from == fromCurrency }).first {
                let newArray = fromArray.filter{ $0.to == rate.from && $0.from == rate.to}
                let newValue = value.multiplying(by: rate.rate)
                print("\(fromCurrency) -> \(rate.to)")
                return convert(value: newValue, fromCurrency: rate.to, toCurrency: toCurrency, fromArray: newArray)
            }
            return 0
        }
    }
}
