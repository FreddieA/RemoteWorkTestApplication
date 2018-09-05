//
//  ProductsViewController.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import UIKit

class ProductsViewController: UITableViewController {
    
    private let storage = TransactionsStorage(plistFileName: "transactions")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = storage
        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        storage.selectedProduct = storage.products[indexPath.row]
        self.navigationController?.pushViewController(TransactionsViewController(storage: storage), animated: true)
    }
}

