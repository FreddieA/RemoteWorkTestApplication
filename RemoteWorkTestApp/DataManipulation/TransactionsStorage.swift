//
//  TransactionsStorage.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import Foundation

class TransactionsStorage: PlistDataParser {
    private(set) var products: [Product]
    
    required init(dataArray: NSArray) {
        products = TransactionsStorage.parseDataArray(dataArray)
    }
    
    static func parseDataArray<Product>(_ array: NSArray) -> [Product] {
        return []
    }
}
