//
//  CoffeeModel.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-08-22.
//

import Foundation

@MainActor
class CoffeeModel: ObservableObject{
    let webService : WebService
    @Published private(set) var orders: [Order] = []
    init(webService: WebService) {
        self.webService = webService
    }
    func populateOrders() async throws {
       orders = try await webService.getOrders()
        
    }
    func placeOrder(_ order: Order) async throws{
       let newOrder =  try await webService.placeOrder(order: order)
        orders.append(newOrder)
    }
}
