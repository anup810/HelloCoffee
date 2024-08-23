//
//  OrderCellView.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-08-22.
//

import SwiftUI

let testOrder = Order(name: "Jane", coffeeName: "latte", total: 4.99, size: .medium)
struct OrderCellView: View {
    let order : Order
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(order.name).accessibilityIdentifier("orderNameText")
                    .bold()
                Text("\(order.coffeeName) (\(order.size.rawValue))")
                    .accessibilityIdentifier("coffeeNameAndSizeText")
                    .opacity(0.5)
            }
            Spacer()
           // Text(String(format:" $%.2f", order.total))
            Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                .accessibilityIdentifier("coffeePriceText")
        }
    }
}

#Preview {
    OrderCellView(order: testOrder)
  
}
