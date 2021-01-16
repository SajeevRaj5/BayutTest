//
//  ProductListViewController.swift
//  BayutTest
//
//  Created by sajeev Raj on 13/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    var presenter: ViewToPresenterProductListProtocol?
    
    var productListData = [ProductViewModel]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.listTableView.reloadData()
            }
        }
    }

    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        
        presenter?.fetchAllProducts()
    }
    
    private func registerCell() {
        listTableView.register(UINib(nibName: ProductListViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProductListViewCell.identifier)
    }
    
}

extension ProductListViewController: PresenterToViewProductListProtocol {
    func showProducts(products: [ProductViewModel]) {
        productListData = products
    }
    
    func showError(error: Error) {
        
    }
    
    func dismissLoader() {
        
    }
    
    
}
