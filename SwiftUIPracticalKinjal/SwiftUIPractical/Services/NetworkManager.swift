//
//  NetworkManager.swift
//  KinjalPracticalSwiftUI
//
//  Created by Kinjal panchal on 10/02/23.
//

import Foundation

class NetworkManager {
   
    static let shared = NetworkManager()
    
    private init() {}
    
    func getProducts(completion : @escaping ((RootProduct?) -> Void)) {
        guard let url = URL(string: UrlConstants.productListUrl) else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            print(response)
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                let result = try? decoder.decode(RootProduct.self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                }
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }.resume()
        
    }
}
    
    
  
