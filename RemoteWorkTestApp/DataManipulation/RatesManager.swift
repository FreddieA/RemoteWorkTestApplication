//
//  RatesManager.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import Foundation

class RatesManager: PlistDataParser {
    typealias Element = TransactionRate
    
    static let shared = RatesManager(plistFileName: "rates")
    
    private(set) var rates: [TransactionRate]
    
    required init(dataArray: NSArray) {
        rates = RatesManager.parseDataArray(dataArray)
    }
    
    static func parseDataArray(_ array: NSArray) -> [TransactionRate] {
        var rates = [TransactionRate]()
        for transactionRateDictionary in array {
            if let rate = TransactionRate.init(dictionary: transactionRateDictionary) {
                rates.append(rate)
            }
        }
        return rates
    }
}
