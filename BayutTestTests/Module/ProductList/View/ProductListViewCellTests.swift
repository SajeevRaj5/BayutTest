//
//  ProductListViewCellTests.swift
//  BayutTestTests
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Quick
import Nimble
@testable import BayutTest

class ProductListViewCellTests: QuickSpec {
    
    override func spec() {
        
        describe("Product list cell configuration") {
            
            var cell : ProductListViewCell!
            
            beforeEach() {
                let tableView = UITableView()
                tableView.register(UINib(nibName: ProductListViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProductListViewCell.identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: ProductListViewCell.identifier) as? ProductListViewCell
            }
            
            context("did display values") {
                beforeEach {
                    let product = MockProducts.shared.products.first!
                    let viewModel = ProductViewModel(product.name, product.price, product.imageUrlsThumbnails.first ?? "")
                    cell.configureView(product: viewModel)
                }
                
                it("should display details") {
                    expect(cell.titleLabel?.text).toNot(beEmpty())
                }
            }
        }
    }
}
