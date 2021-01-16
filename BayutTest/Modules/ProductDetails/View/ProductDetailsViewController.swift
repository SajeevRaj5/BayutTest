//
//  ProductDetailsViewController.swift
//  BayutTest
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    var presenter: ViewToPresenterProductDetailProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ProductDetailsViewController: PresenterToViewProductDetailProtocol {
    func showDetailForProduct(product: Product) {
        
    }
    
    
}
