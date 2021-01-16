//
//  RecipeDetailViewControllerTests.swift
//  BayutTestTests
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Quick
import Nimble
@testable import BayutTest

class RecipeDetailViewControllerTests: QuickSpec {
    
    class MockPresenter : ViewToPresenterProductDetailProtocol {

        var product: Product?
        
        var view: PresenterToViewProductDetailProtocol?
        var didShowDetail = false
        
        func showDetail() {
            didShowDetail = true
        }
    }
    
    override func spec() {
        var viewController: ProductDetailsViewController?
        var presenter: MockPresenter?
        
        beforeEach() {
            viewController = ProductDetailRouter.createModule(with: MockProducts.shared.products.first!)
            presenter = MockPresenter()
            viewController?.presenter = presenter
            _ = viewController?.view
        }
        
        describe("Check if loaded") {
            
            it("Should load view") {
                expect(viewController?.title).to(equal("Details"))
                expect(presenter?.didShowDetail).to(equal(true))
            }
        }
        
        describe("Check if data is displayed") {
            
            beforeEach() {
                presenter?.showDetail()
            }
            
            it("Should display data") {
                
                expect(viewController?.nameLabel?.text).toNot(beNil())
                expect(viewController?.priceLabel?.text).toNot(beNil())
            }
        }
        
        describe("Check if data is displayed") {
            
            beforeEach() {
                viewController?.presenter?.product = MockProducts.shared.products.first
                viewController?.showDetailForProduct(product: (viewController?.presenter?.product)!)
            }
            
            it("Should display data") {
                
                expect(viewController?.nameLabel?.text).toNot(beNil())
                expect(viewController?.priceLabel?.text).toNot(beNil())
            }
        }
    }
}
