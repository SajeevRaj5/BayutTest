//
//  ProductListRouter.swift
//  BayutTest
//
//  Created by sajeev Raj on 13/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation
import UIKit

class ProductListRouter: PresenterToRouterProtocol {
    static func createModule() -> ProductListViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ProductListViewController.identifier) as? ProductListViewController else { return ProductListViewController() }
        
        var presenter: ViewToPresenterProductListProtocol & InteractorToPresenterProductListProtocol = ProductListPresenter()
        var interactor: PresenterToInteractorProductListProtocol = ProductListInteractor()
        let router: PresenterToRouterProtocol = ProductListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    
}
