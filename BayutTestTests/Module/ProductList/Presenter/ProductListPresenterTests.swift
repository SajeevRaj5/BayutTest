//
//  ProductListPresenterTests.swift
//  BayutTestTests
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Quick
import Nimble

@testable import BayutTest

class ProductListPresenterTests: QuickSpec {
    
    class MockInteractor: PresenterToInteractorProductListProtocol {
        let mockProducts = MockProducts.shared.products
        var isSuccess = true
        var presenter: InteractorToPresenterProductListProtocol?
        
        func fetchProducts() {
            presenter?.onServerResponseReceival()
            
            if isSuccess {
                presenter?.onSuccessProductsFetch(products: mockProducts)
            } else {
                presenter?.onFailedProductsFetch(error: NSError(domain: "test error", code: 123, userInfo: nil))
            }
        }
    }

    class MockRouter: PresenterToRouterProtocol {
        var product : Product?
        
        static func createModule() -> ProductListViewController {
            return ProductListRouter.createModule()
        }

        func showProductDetailView(navigationController: UINavigationController, product: Product) {
            self.product = product
        }
    }
    
    class MockView: PresenterToViewProductListProtocol {
        
        var shouldShowProducts = false
        var shouldDismissLoader = false
        var shouldShowError = false

        func showError(error: Error) {
            shouldShowError = true
        }
        
        func dismissLoader() {
            shouldDismissLoader = true
        }
        
        func showProducts(products: [ProductViewModel]) {
            shouldShowProducts = true
        }
    }
    
    var presenter: ProductListPresenter!
    var mockInteractor: MockInteractor!
    var mockRouter: MockRouter!
    var mockProducts: [Product]!
    var mockView: MockView!
    
    override func spec() {
       
        beforeEach() {
            self.presenter = ProductListPresenter()
            self.mockRouter = MockRouter()
            self.presenter?.router = self.mockRouter

            self.mockInteractor = MockInteractor()
            self.mockInteractor.presenter = self.presenter
            self.presenter?.interactor = self.mockInteractor

            self.mockView = MockView()
            self.presenter?.view = self.mockView
            self.mockProducts = MockProducts.shared.products
        }
        
        describe("Recipe Fetch Dismiss loader") {

            it("Should dismiss loader after the recipes are fetched") {
                self.presenter.fetchAllProducts()
                expect(self.mockView.shouldDismissLoader).to(equal(true))
            }
        }
        
        describe("Recipe Fetch Success") {

            it("Should display the fetched Recipes") {
                self.mockInteractor.isSuccess = true
                self.presenter.fetchAllProducts()
                expect(self.mockView.shouldShowProducts).to(equal(true))
            }
        }
        
        describe("Recipe Fetch Failure") {

            it("Should handle failure of the fetch Recipes") {
                self.mockInteractor.isSuccess = false
                self.presenter.fetchAllProducts()
                expect(self.mockView.shouldShowProducts).to(equal(false))
            }
        }
    }

}
