//
//  ProductListPresenter.swift
//  BayutTest
//
//  Created by sajeev Raj on 13/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation

class ProductListPresenter: ViewToPresenterProductListProtocol {
    
    var products: [Product]?
    
    weak var view: PresenterToViewProductListProtocol?
    
    var interactor: PresenterToInteractorProductListProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func fetchAllProducts() {
        interactor?.fetchProducts()
    }
}

extension ProductListPresenter: InteractorToPresenterProductListProtocol {
    func onSuccessProductsFetch(products: [Product]) {
        
    }
    
    func onFailedProductsFetch(error: Error) {
        
    }
    
    func onServerResponseReceival() {
        
    }
}
