//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by David Amunga on 13/02/2020.
//  Copyright © 2020 David Amunga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    
    var body: some View {
        NavigationView{
            OrderListView(orders:self.orderListVM.orders)
                
                
            .navigationBarTitle("Coffee Orders")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
