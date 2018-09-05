//
//  RatesManager.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import Foundation

class RatesManager: PlistDataParser {
    
    private(set) var rates: [TransactionRate]
    
    required init(dataArray: NSArray) {
        rates = RatesManager.parseDataArray(dataArray)
    }
    
    static func parseDataArray<TransactionRate>(_ array: NSArray) -> [TransactionRate] {
        return []
    }
}
