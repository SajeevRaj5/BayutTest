//
//  AlertController.swift
//  BayutTest
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation
import UIKit

typealias VoidClosure = () -> ()

class AlertController {
    enum Alert {
        case serviceError
        
        var title: String {
            switch self {
            case .serviceError: return "Service unavailable"
            }
        }
        
        var message: String {
            switch self {
            case .serviceError: return "Something went wrong. Please try again later"
            }
        }
        
        var needTwoButtons: Bool {
            switch self {
            case .serviceError: return false
            }
        }
    }
    
    class func show(type: Alert, error: Error? = nil, successHandler: VoidClosure? = nil, cancelHandler: VoidClosure? = nil) {
        let alertController = UIAlertController(title: type.title, message: error?.localizedDescription ?? type.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .destructive) { (action) in
            successHandler?()
        }
        alertController.addAction(okAction)
        if type.needTwoButtons {
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                cancelHandler?()
            }
            alertController.addAction(cancelAction)
        }
        DispatchQueue.main.async {
            topMostViewController().present(alertController, animated: true, completion: nil)
        }
    }
    
    class func topMostViewController() -> UIViewController {
        var topViewController: UIViewController? = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController
        while ((topViewController?.presentedViewController) != nil) {
            topViewController = topViewController?.presentedViewController
        }
        return topViewController!
    }
}
