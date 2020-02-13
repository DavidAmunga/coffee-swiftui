//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrderingApp
//
//  Created by David Amunga on 13/02/2020.
//  Copyright © 2020 David Amunga. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel:ObservableObject{
 
    private var webService: WebService
    
    var name : String = ""
    @Published var size : String = "Medium"
    @Published var coffeeName: String = ""
    
    var coffeeList: [CoffeeViewModel]{
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.webService = WebService()
    }
    var total: Double{
        return calculateTotalPrice()
    }
    func placeOrder(){
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        self.webService.createCoffeeOrder(order: order) { (_) in
        
        }
    }
    
    private func priceForSize()->Double{
        let prices = ["Small":2.0,"Medium":3.0,"Large":4.0]
        return prices[self.size]!
    }
    
    private func calculateTotalPrice()->Double{
        let coffeeVM = coffeeList.first{$0.name == coffeeName}
        if let coffeeVM = coffeeVM{
            return coffeeVM.price * priceForSize()
        }else{
            return 0.0
        }
    }
}
