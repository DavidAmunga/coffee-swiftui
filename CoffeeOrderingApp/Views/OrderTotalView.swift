//
//  OrderTotalView.swift
//  CoffeeOrderingApp
//
//  Created by David Amunga on 13/02/2020.
//  Copyright © 2020 David Amunga. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total : Double
    
    var body: some View {
        HStack(alignment:.center){
            Spacer()
            Text(String(format:"KES %.2f",self.total))
                .font(.title)
                .foregroundColor(Color.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total:45.85)
    }
}
