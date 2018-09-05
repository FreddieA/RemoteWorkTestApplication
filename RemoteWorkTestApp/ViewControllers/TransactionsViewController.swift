//
//  TransactionsViewController.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import UIKit

class TransactionsViewController: UITableViewController {
    
    private let cellReuseIdentifier = "gbpAmountCellIdentifier"
    
    private weak var storage: TransactionsStorage?
    private var targetCurrency: String?
    
    lazy var decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    convenience init(storage: TransactionsStorage, _ currency: String = "GBP") {
        self.init(style: .plain)
        self.storage = storage
        self.targetCurrency = currency
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        title = "Transactions for \(storage?.selectedProduct?.sku ?? "product")"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let transactions = storage?.selectedProduct?.transactions else {
            return 0
        }
        return transactions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let transactions = storage?.selectedProduct?.transactions else {
            return UITableViewCell()
        }
        let transaction = transactions[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) {
            populate(cell: cell, with: transaction)
            return cell
        } else {
            let cell = UITableViewCell.init(style: .value1, reuseIdentifier: cellReuseIdentifier)
            populate(cell: cell, with: transaction)
            return cell
        }
    }
    
    private func populate(cell: UITableViewCell, with transaction: Transaction) {
        guard let currency = targetCurrency else {
            return
        }
        decimalFormatter.currencyCode = transaction.currency
        cell.textLabel?.text = decimalFormatter.string(from: transaction.amount)
        
        decimalFormatter.currencyCode = currency
        cell.detailTextLabel?.text = decimalFormatter.string(from: TransactionRate.convert(value: transaction.amount,
                                                                                     fromCurrency: transaction.currency,
                                                                                     toCurrency: currency,
                                                                                     fromArray: RatesManager.shared.rates))
    }
}
