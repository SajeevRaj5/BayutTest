//
//  Product.swift
//  BayutTest
//
//  Created by sajeev Raj on 12/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation

class Product: Codable {
    let createdAt, price, name, uid: String
    let imageUrls, imageUrlsThumbnails: [String]

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
    
    required init(from decoder: Decoder) throws {

        let container   = try decoder.container(keyedBy: CodingKeys.self)
        createdAt           = try container.decode(String.self, forKey: .createdAt)
        price      = try container.decode(String.self, forKey: .price)
        name            = try container.decode(String.self, forKey: .name)
        
        imageUrls            = try container.decode([String].self, forKey: .imageUrls)
        imageUrlsThumbnails            = try container.decode([String].self, forKey: .imageUrlsThumbnails)
        uid            = try container.decode(String.self, forKey: .uid)
    }
    
    static func getProducts(completion: @escaping (ServiceResponse<ProductResponse>) -> ()) {
        Router.products.request { (response: ServiceResponse<ProductResponse>) in
             switch response {
             case .success(let results):
                 completion(.success(data: results))
             case .failure(let error):
                 completion(.failure(error: error))
             case .finally:
                 completion(.finally)
             }
         }
    }
}

extension Product {
    enum Router: Requestable {
        case products
        
        var path: String {
            switch self {
            case .products: return "dynamodb-writer"
            }
        }
    }
}

class ProductResponse: Codable {
    let results: [Product]?
}
