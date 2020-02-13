//
//  AddCoffeeOrderView.swift
//  CoffeeOrderingApp
//
//  Created by David Amunga on 13/02/2020.
//  Copyright © 2020 David Amunga. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    
    var body: some View {
        NavigationView{
            
            
            
            VStack{
                Form{
                    Section(header: Text("Information")
                        .font(.body))
                    {
                        TextField("Enter Name",text:self.$addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("Select Coffee")
                        .font(.body))
                    {
                        ForEach(addCoffeeOrderVM.coffeeList,id:\.name){
                            coffee in
                            CoffeeCellView(coffee:coffee,selection: self.$addCoffeeOrderVM.coffeeName)
                            
                            
                            
                        }
                    }
                    
                    Section(header:Text("Select Coffee").font(.body),
                            footer:Text("Total")){
                                Picker("",selection: self.$addCoffeeOrderVM.size){
                                    
                                    Text("Small").tag("Small")
                                    Text("Medium").tag("Medium")
                                    Text("Large").tag("Large")
                                    
                                }.pickerStyle(SegmentedPickerStyle())
                                
                    }
                    
                }
                HStack{
                    Button("Place Order"){
                        
                    }
                }.padding(EdgeInsets(top:12,leading:100,bottom:12,trailing:100))
                    .foregroundColor(Color.white)
                .background(Color(red:46/255,green:204/255,blue:113/255))
                    .cornerRadius(10)
                
                
            }
            .navigationBarTitle("Add Order")
        }
       
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView()
    }
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection:String
    
    var body: some View {
        HStack{
            Image(coffee.imageURL)
                .resizable()
                .frame(width:100,height:100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading],20)
            Image(systemName:self.selection == self.coffee.name ?
                "checkmark":"")
                .padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
