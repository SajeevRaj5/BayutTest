//
//  ProductListInteractor.swift
//  BayutTest
//
//  Created by sajeev Raj on 13/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation

class ProductListInteractor: PresenterToInteractorProductListProtocol {
    weak var presenter: InteractorToPresenterProductListProtocol?
    
    func fetchProducts() {
        Product.getProducts { [weak self] (response) in
            guard let welf = self else { return }
            
            switch response {
            case .success(let response):
                guard let products = response.results else { return }
                
                // send events to presenter
                welf.presenter?.onSuccessProductsFetch(products: products)
                
            case .failure(let error):
                welf.presenter?.onFailedProductsFetch(error: error)
            case .finally:
                welf.presenter?.onServerResponseReceival()
            }
        }
    }
    
    
}
