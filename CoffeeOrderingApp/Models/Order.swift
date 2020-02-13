//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by David Amunga on 13/02/2020.
//  Copyright © 2020 David Amunga. All rights reserved.
//

import Foundation


struct Order:Codable{
    
    let name: String
    let size: String
    let coffeeName: String
    let total : Double
}
