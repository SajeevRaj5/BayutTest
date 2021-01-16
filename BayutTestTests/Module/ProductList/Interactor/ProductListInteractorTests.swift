//
//  ProductListInteractorTests.swift
//  BayutTestTests
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Quick
import Nimble
@testable import BayutTest

class ProductListInteractorTests: QuickSpec {

    class MockPresenter: InteractorToPresenterProductListProtocol {
        func onSuccessProductsFetch(products: [Product]) {
            mockProducts = MockProducts.shared.products
        }
        
        func onFailedProductsFetch(error: Error) {
            self.error = error
        }
        
        func onServerResponseReceival() {
            didonServerResponseReceival = true
        }
        
        var mockProducts = [Product]()
        var error: Error?
        var didonServerResponseReceival = false
        
    }
    
    override func spec() {

        var presenter: MockPresenter!
        var interactor: ProductListInteractor!

        describe("Products Fetch") {
            
            beforeEach() {
                interactor = ProductListInteractor()
                presenter = MockPresenter()
                interactor.presenter = presenter
            }
            
            it("Should show the fetched products") {
                interactor.fetchProducts()
            }
        }
    }
}

