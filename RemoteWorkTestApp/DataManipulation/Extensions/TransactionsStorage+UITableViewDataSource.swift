//
//  TransactionsStorage+UITableViewDataSource.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import UIKit

extension TransactionsStorage: UITableViewDataSource {
    
    private static let cellReuseIdentifier = "TransactionTableCellIdentifier"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = TransactionsStorage.cellReuseIdentifier
        let product = products[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) {
            populate(cell: cell, with: product)
            return cell
        } else {
            let cell = UITableViewCell.init(style: .value1, reuseIdentifier: identifier)
            populate(cell: cell, with: product)
            return cell
        }
    }
    
    private func populate(cell: UITableViewCell, with product: Product) {
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = product.sku
        cell.detailTextLabel?.text = product.transactionsTitle
    }
}
