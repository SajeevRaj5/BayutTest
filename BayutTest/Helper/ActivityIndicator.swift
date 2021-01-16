//
//  ActivityIndicator.swift
//  BayutTest
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation
import UIKit

// Used for ViewControllers that need to present an activity indicator when loading data.
public protocol ActivityIndicatorPresenter {

    // The activity indicator
    var activityIndicator: UIActivityIndicatorView { get }

    // Show the activity indicator in the view
    func showLoader()

    // Hide the activity indicator in the view
    func hideLoader()
}

public extension ActivityIndicatorPresenter where Self: UIViewController {

    func showLoader() {
        DispatchQueue.main.async { [weak self] in
            guard let welf = self else { return }
            let yPositionPadding: CGFloat = 70
            welf.activityIndicator.style = UIActivityIndicatorView.Style.large
            welf.activityIndicator.color = .white
            welf.activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80) //or whatever size you would like
            welf.activityIndicator.center = CGPoint(x: UIScreen.main.bounds.maxX/2, y: UIScreen.main.bounds.maxY/2 - yPositionPadding)
            welf.view.addSubview(welf.activityIndicator)
            welf.activityIndicator.layer.zPosition = 1000
            welf.activityIndicator.startAnimating()
        }
    }

    func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            guard let welf = self else { return }
            welf.activityIndicator.stopAnimating()
            welf.activityIndicator.removeFromSuperview()
        }
    }
}

