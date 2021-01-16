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
        
                var productViewModels = [ProductViewModel]()
        
        for product in products {
            let productViewModel: ProductViewModel = (product.name, product.price, product.imageUrlsThumbnails.first ?? "")
            productViewModels.append(productViewModel)
        }
        
        view?.showProducts(products: productViewModels)
    }
    
    func onFailedProductsFetch(error: Error) {
        
    }
    
    func onServerResponseReceival() {
        
    }
}
