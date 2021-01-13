//
//  ServiceManager.swift
//  BayutTest
//
//  Created by sajeev Raj on 12/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation

typealias ServiceResponseBlock<T: Codable> = (ServiceResponse<T>) -> ()

class ServiceManager {
    
    static let shared = ServiceManager()
        
    var dataTask: URLSessionDataTask?

    private init() {}
    
    func request<T>(request: URLRequest, completion: ServiceResponseBlock<T>?) where T: Codable {
    
        URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let error = error {
                completion?(.failure(error: error))
                completion?(.finally)
                return
            }
            guard let _ = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                completion?(.failure(error: error))
                completion?(.finally)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(T.self, from: data)
                completion?(.success(data: responseData))
                completion?(.finally)
                
            } catch let error {
                print("Error", error)
                completion?(.failure(error: error))
                completion?(.finally)
            }
        }.resume()
    }
}

extension ServiceManager {
    struct API {
        static var baseUrl: URL? {
            return URL(string: "")
        }
    }
}

// set HTTP methods
enum HTTPMethod: String {
    case get
    case post
    case update
    case delete
}
