//
//  ProductDetailRouterTests.swift
//  BayutTestTests
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Quick
import Nimble
@testable import BayutTest

class ProductDetailRouterTests: QuickSpec {

    override func spec() {

        describe("Should create the module and present") {
            
            it("should have create and configured ProductDetailsViewController") {
                let productDetailViewController = ProductDetailRouter.createModule(with: MockProducts.shared.products.first!)
                expect(productDetailViewController).to(beAKindOf(ProductDetailsViewController.self))
                expect(productDetailViewController.presenter).toNot(beNil())
                expect(productDetailViewController.presenter?.view).toNot(beNil())
            }
        }
    }
}
