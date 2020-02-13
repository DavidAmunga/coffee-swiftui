//
//  WebService.swift
//  CoffeeOrderingApp
//
//  Created by David Amunga on 13/02/2020.
//  Copyright © 2020 David Amunga. All rights reserved.
//

import Foundation

class WebService{
    
    func getAllOrders( completion: @escaping ([Order]?) -> ()){
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else{
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            
            let orders =  try? JSONDecoder().decode([Order].self, from: data)
            
            DispatchQueue.main.async {
                completion(orders)
            }
            
            
        }.resume()
        
    }
}
