//
//  ProductDetailPresenter.swift
//  BayutTest
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation
class ProductDetailPresenter: ViewToPresenterProductDetailProtocol {
    
    var product: Product?

    var view: PresenterToViewProductDetailProtocol?
    
    // show product details
    func showDetail() {
        guard let product = product else { return }
        view?.showDetailForProduct(product: product)
    }
}
