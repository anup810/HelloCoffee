//
//  ContentView.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-08-22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model : CoffeeModel
    private func populateOrders() async {
        do{
            try await model.populateOrders()
        }catch{
            print(error)
        }
    }
    var body: some View {
        VStack {
            if model.orders.isEmpty {
                Text("No orders available!") .accessibilityIdentifier("noOrdersText")

            } else {
                List(model.orders) { (order: Order) in
                    OrderCellView(order: order)

                }
            }
        }
        .task {
            await populateOrders()
        }
       
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var config = Configuration()
        ContentView()
            .environmentObject(CoffeeModel(webService: WebService(baseURL: config.environment.baseURL)))
    }
}

