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
                Text("Loading orders...")
            } else {
                List(model.orders) { order in
                    OrderCellView(order: order)
                }
            }
        }
        .task {
            await populateOrders()
        }
       
    }
    
}
#Preview {
    ContentView()
        .environmentObject(CoffeeModel(webService: WebService()))
}
