//
//  ProductListViewController.swift
//  BayutTest
//
//  Created by sajeev Raj on 13/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController, ActivityIndicatorPresenter {
    var activityIndicator = UIActivityIndicatorView()

    var presenter: ViewToPresenterProductListProtocol?
    
    var productListData = [ProductViewModel]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.listTableView?.reloadData()
            }
        }
    }

    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Products"

        registerCell()
        
        showLoader()
        
        // fetch all products
        presenter?.fetchAllProducts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func registerCell() {
        listTableView.register(UINib(nibName: ProductListViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProductListViewCell.identifier)
    }
    
}

// Tableview delegates
extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let productCell = tableView.dequeueReusableCell(withIdentifier: ProductListViewCell.identifier, for: indexPath) as? ProductListViewCell else { return UITableViewCell() }
        productCell.configureView(product: productListData[indexPath.row])

        return productCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigation = navigationController else { return }
        presenter?.showProductDetail(navigationController: navigation, forProductAt: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// delegate methods to perform actions
extension ProductListViewController: PresenterToViewProductListProtocol {
    func showProducts(products: [ProductViewModel]) {
        productListData = products
    }
    
    func showError(error: Error) {
        AlertController.show(type: .serviceError)
    }
    
    func dismissLoader() {
        hideLoader()
    }
}
