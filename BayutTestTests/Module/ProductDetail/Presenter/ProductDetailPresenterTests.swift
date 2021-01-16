//
//  ProductDetailPresenterTests.swift
//  BayutTestTests
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Quick
import Nimble
@testable import BayutTest

class ProductDetailPresenterTests: QuickSpec {
    
    class MockView: PresenterToViewProductDetailProtocol {
        var showDetailForProduct = false
        
        func showDetailForProduct(product: Product) {
            showDetailForProduct = true
        }
    }
    
    var presenter: ProductDetailPresenter!
    var product: Product?
    var mockView: MockView!
    
    override func spec() {
        
        describe("Products Fetch") {
            beforeEach() {
                self.presenter = ProductDetailPresenter()
                self.mockView = MockView()
                self.presenter?.view = self.mockView
                self.product =  MockProducts.shared.products.first!
                self.presenter.showDetail()
            }
            
            it("Should show the passed values") {
                self.presenter.showDetail()
                expect(self.mockView.showDetailForProduct).to(equal(false))
            }
        }
    }
}
