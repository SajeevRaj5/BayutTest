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

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Details"
        
        dateLabel.adjustsFontSizeToFitWidth = true
        presenter?.showDetail()
    }

}

extension ProductDetailsViewController: PresenterToViewProductDetailProtocol {
    func showDetailForProduct(product: Product) {
        nameLabel.text = product.name
        priceLabel.text = product.price
        dateLabel.text = product.createdAt
        print(product.createdAt)
        
        guard let url = URL(string: product.imageUrls.first ?? "") else { return }
        url.image { [weak self] (image) in
            guard let productImage = image else { return }
            self?.imageView?.image = productImage
        }
    }
    
    
}
