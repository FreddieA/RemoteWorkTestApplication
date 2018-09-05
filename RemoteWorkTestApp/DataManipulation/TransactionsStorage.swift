//
//  TransactionsStorage.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import Foundation

class TransactionsStorage: NSObject, PlistDataParser {
    typealias Element = Product
    
    private(set) var products: [Product]
    
    required init(dataArray: NSArray) {
        products = TransactionsStorage.parseDataArray(dataArray)
    }
    
    static func parseDataArray(_ array: NSArray) -> [Product] {
        var productsDict = [String: [Transaction]]()
        for transactionDictionary in array {
            
            if let transaction = Transaction(dictionary: transactionDictionary) {
                if productsDict[transaction.productSku] != nil {
                    productsDict[transaction.productSku]?.append(transaction)
                } else {
                    productsDict[transaction.productSku] = [transaction]
                }
            }
        }
        return productsDict.map { return Product(sku: $0, transactions: $1) }
    }
}
