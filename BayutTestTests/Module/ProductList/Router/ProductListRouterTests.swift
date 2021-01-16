//
//  ProductListRouterTests.swift
//  BayutTestTests
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import BayutTest

class ProductListRouterTests: QuickSpec {
    
    override func spec() {
        
        var productListRouter: ProductListRouter!
        var navigationController: MockNavigationController!
        var product: Product!
        
        beforeEach() {
            productListRouter = ProductListRouter()
            product = MockProducts.shared.products.first
        }
        
        describe("Should show details page") {
            
            beforeEach() {
                navigationController = MockNavigationController().getNavigationController(for: ProductListRouter.createModule())
            }
            
            it("should have presented RecipeListViewController") {
                productListRouter.showProductDetailView(navigationController: navigationController, product: product)
                expect(navigationController.pushedViewController).to(beAKindOf(ProductDetailsViewController.self))
            }
        }
        
        describe("Should create the module and present") {
            
            it("should have presented RecipeListViewController") {
                let productListViewController = ProductListRouter.createModule()
                expect(productListViewController).to(beAKindOf(ProductListViewController.self))

                expect(productListViewController.presenter).toNot(beNil())
                expect(productListViewController.presenter?.view).toNot(beNil())
                expect(productListViewController.presenter?.interactor).toNot(beNil())
                expect(productListViewController.presenter?.router).toNot(beNil())
            }
        }
    }
}
