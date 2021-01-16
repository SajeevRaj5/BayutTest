//
//  ProductListPresenter.swift
//  BayutTest
//
//  Created by sajeev Raj on 13/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation
import UIKit

class ProductListPresenter: ViewToPresenterProductListProtocol {
    
    var products: [Product]?
    
    weak var view: PresenterToViewProductListProtocol?
    
    var interactor: PresenterToInteractorProductListProtocol?
    
    var router: PresenterToRouterProtocol?
    
    // fetch products from service
    func fetchAllProducts() {
        interactor?.fetchProducts()
    }
    
    // go to product details screen
    func showProductDetail(navigationController: UINavigationController, forProductAt index: Int) {
        guard let selectedProduct = products?[index] else { return }
        router?.showProductDetailView(navigationController: navigationController, product: selectedProduct)
    }
    
}

extension ProductListPresenter: InteractorToPresenterProductListProtocol {
    
    // handle received products from service
    func onSuccessProductsFetch(products: [Product]) {
        self.products = products
        var productViewModels = [ProductViewModel]()
        
        // map product model to view models
        for product in products {
            let productViewModel: ProductViewModel = (product.name, product.price, product.imageUrlsThumbnails.first ?? "")
            productViewModels.append(productViewModel)
        }
        
        view?.showProducts(products: productViewModels)
    }
    
    // show error on service failure
    func onFailedProductsFetch(error: Error) {
        view?.showError(error: error)
    }
    
    // dismiss loader on service call completion
    func onServerResponseReceival() {
        view?.dismissLoader()
    }
}
