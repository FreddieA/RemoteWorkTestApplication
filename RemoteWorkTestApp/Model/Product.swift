//
//  Product.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import Foundation

class Product {
    var transactions: [Transaction]
    let sku: String
    
    init(sku: String, transactions: [Transaction] = []) {
        self.sku = sku
        self.transactions = transactions
    }
    
    var transactionsTitle: String {
        return "\(transactions.count) transactions"
    }
}
