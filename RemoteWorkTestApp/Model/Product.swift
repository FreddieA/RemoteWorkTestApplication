//
//  Product.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import Foundation

struct Product {
    var transactions: [Transaction]
    let sku: String
    
    init(sku: String, transactions: [Transaction] = []) {
        self.sku = sku
        self.transactions = transactions
    }
    
    var transactionsTitle: String {
        return "\(transactions.count) transactions"
    }
    
    func transactionsTotal(currency: String) -> NSDecimalNumber {
        return transactions.reduce(0, { (result, transaction) -> NSDecimalNumber in
            guard let convertedResult = TransactionRate.convertValue(rateValue: transaction.amount,
                                                               rateTuple: (transaction.currency, currency),
                                                               using: RatesManager.shared.rates) else {
                                                                return result
            }
            return result.adding(convertedResult, withBehavior: TransactionRate.decimalBehaviour)
        })
    }
}
