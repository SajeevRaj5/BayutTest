//
//  ProductListProtocols.swift
//  BayutTest
//
//  Created by sajeev Raj on 13/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation
import UIKit

// protocol to handle interaction from view to presenter
protocol ViewToPresenterProductListProtocol {
    var view: PresenterToViewProductListProtocol? {get set}
    var interactor: PresenterToInteractorProductListProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    var products: [Product]? {get set}
    
    func fetchAllProducts()
    func showProductDetail(navigationController: UINavigationController, forProductAt index: Int)
}

// protocol to handle interaction from presenter to view
protocol PresenterToViewProductListProtocol: class {
    func showProducts(products: [ProductViewModel])
    func showError(error: Error)
    func dismissLoader()
}

// protocol to handle interaction from presenter to interactor
protocol PresenterToInteractorProductListProtocol {
    var presenter: InteractorToPresenterProductListProtocol? {get set}
    func fetchProducts()
}

// protocol to handle interaction from interactor to presenter
protocol InteractorToPresenterProductListProtocol: class {
    func onSuccessProductsFetch(products: [Product])
    func onFailedProductsFetch(error: Error)
    func onServerResponseReceival()
}

// protocol to handle navigation
protocol PresenterToRouterProtocol {
    static func createModule() -> ProductListViewController
    func showProductDetailView(navigationController: UINavigationController,  product: Product)
}
