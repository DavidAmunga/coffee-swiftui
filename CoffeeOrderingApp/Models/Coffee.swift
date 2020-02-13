//
//  Coffee.swift
//  CoffeeOrderingApp
//
//  Created by David Amunga on 13/02/2020.
//  Copyright © 2020 David Amunga. All rights reserved.
//

import Foundation

struct Coffee{
    let name: String
    let imageURL : String
    let price: Double
}


extension Coffee{
    static func all()->[Coffee]{
        return[
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            
            Coffee(name: "Expresso", imageURL: "Expresso", price: 2.1),
            
            Coffee(name: "Regular", imageURL: "Regular", price: 3.0)
        ]
    }
}

