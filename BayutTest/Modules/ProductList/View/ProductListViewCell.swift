//
//  ProductListViewCell.swift
//  BayutTest
//
//  Created by sajeev Raj on 13/01/2021.
//  Copyright © 2020 BayutApp. All rights reserved.
//

import UIKit

typealias ProductViewModel = (title:String, price:String, imageUrlString:String)

class ProductListViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    @IBOutlet weak var iconImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func configureView(product: ProductViewModel) {
        titleLabel?.text = product.title
        priceLabel?.text = product.price
        iconImageView?.image = UIImage(named: "productPlaceholder")
        guard let url = URL(string: product.imageUrlString) else { return }
        url.image { [weak self] (image) in
            guard let productImage = image else { return }
            self?.iconImageView?.image = productImage
        }
    }
    
}
