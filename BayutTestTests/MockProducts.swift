//
//  MockProducts.swift
//  BayutTestTests
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation

@testable import BayutTest

class MockProducts {
    var products = [Product]()
    static var shared = MockProducts()
    
    private init() {
        
        let data = loadDataFromBundle(withName: "Resources", extension: "json")

        let decodedObject = try? JSONDecoder().decode(ProductResponse.self, from: data)
        self.products = decodedObject!.results!
    }
    
    func loadDataFromBundle(withName name: String, extension: String) ->  Data {
        let bundle =  Bundle.main
        let url = bundle.url(forResource: name, withExtension: `extension`)
        let data = try! Data(contentsOf: url!)
        return data
    }
}
