//
//  OrderListViewModel.swift
//  CoffeeOrderingApp
//
//  Created by David Amunga on 13/02/2020.
//  Copyright © 2020 David Amunga. All rights reserved.
//

import Foundation

class OrderListViewModel : ObservableObject{
    
    @Published var orders = [OrderViewModel]()
    
    
    init() {
        fetchOrders()
    }
    func fetchOrders(){
        WebService().getAllOrders { (orders) in
            if let orders = orders{
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}


class OrderViewModel{
    var order : Order
    
    let id = UUID()
    
    init(order:Order) {
        self.order = order
    }
    
    var name: String{
        return self.order.name
    }
    
    var size: String{
        return self.order.size
    }
    
    var coffeeName : String{
        return self.order.coffeeName
    }
    
    var total : Double{
        return self.order.total
    }
}
