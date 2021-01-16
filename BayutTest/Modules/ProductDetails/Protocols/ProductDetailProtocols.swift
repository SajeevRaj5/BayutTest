//
//  ProductDetailProtocols.swift
//  BayutTest
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation

protocol ViewToPresenterProductDetailProtocol {
    var view: PresenterToViewProductDetailProtocol? {get set}
    var product: Product? {get set}
    
    func showDetail()
}

protocol PresenterToViewProductDetailProtocol {
    func showDetailForProduct(product: Product)
}
