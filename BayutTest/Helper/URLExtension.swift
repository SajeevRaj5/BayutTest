//
//  URLExtension.swift
//  BayutTest
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation
import UIKit

extension URL {
    func image(completion: @escaping ((UIImage?) -> Void)) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: self) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
