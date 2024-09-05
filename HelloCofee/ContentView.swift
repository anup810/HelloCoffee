//
//  ContentView.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-08-22.
//

//
//  ContentView.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-08-22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: CoffeeModel
    @State private var isPresented: Bool = false
    
    private func populateOrders() async {
        do {
            try await model.populateOrders()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if model.orders.isEmpty {
                    Text("No orders available!")
                        .accessibilityIdentifier("noOrdersText")
                } else {
                    List(model.orders) { (order: Order) in
                        OrderCellView(order: order)
                    }
                }
            }
            .task {
                await populateOrders()
            }
            .sheet(isPresented: $isPresented, content: {
                AddCoffeeView()
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add New Order") {
                        isPresented = true
                    }
                    .accessibilityIdentifier("addNewOrderButton")
                }
            }
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
