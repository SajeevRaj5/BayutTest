//
//  ProductListViewControllerTests.swift
//  BayutTestTests
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Quick
import Nimble
@testable import BayutTest

class ProductListViewControllerTests: QuickSpec {
    class MockPresenter : ViewToPresenterProductListProtocol {
        var products: [Product]?
        
        var didFetchAllProducts = false
        
        var view: PresenterToViewProductListProtocol?
        var interactor: PresenterToInteractorProductListProtocol?
        var router: PresenterToRouterProtocol?
        
        func fetchAllProducts() {
            didFetchAllProducts = true
        }
        
        func showProductDetail(navigationController: UINavigationController, forProductAt index: Int) { }

    }
    
    override func spec() {
        var viewController: ProductListViewController?
        var presenter: MockPresenter?
        
        beforeEach() {
            
            viewController = ProductListRouter.createModule()
            presenter = MockPresenter()
            viewController?.presenter = presenter
            _ = viewController?.view
        }
        
        describe("Check if loaded") {
            
            it("Should load view") {
                expect(viewController?.title).toNot(beEmpty())
            }
        }
        
        describe("Check if no data recived ") {

            beforeEach() {
                viewController?.productListData = []
            }
            
            it("Should display empty view") {
            expect(viewController?.listTableView.numberOfRows(inSection: 0)).to(equal(0))
            }
        }
        
        describe("Check if recived data is displayed") {
            
            beforeEach() {
                
                var productViewModels = [ProductViewModel]()
                
                // map product model to view models
                for product in MockProducts.shared.products {
                    let productViewModel: ProductViewModel = (product.name, product.price, product.imageUrlsThumbnails.first ?? "")
                    productViewModels.append(productViewModel)
                }
                
                viewController?.productListData = productViewModels
            }
            
            it("Should refresh view") {
                expect(viewController?.listTableView.numberOfRows(inSection: 0)).to(equal(viewController?.productListData.count ?? 0))
            }
        }
    }
}

