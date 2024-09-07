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
    func orderById(_ id: Int) -> Order?{
        guard let index = orders.firstIndex(where: {$0.id == id}) else {
            return nil
        }
        return orders[index]
    }
    func populateOrders() async throws {
       orders = try await webService.getOrders()
        
    }
    func placeOrder(_ order: Order) async throws{
       let newOrder =  try await webService.placeOrder(order: order)
        orders.append(newOrder)
    }
    func deleteOrder(_ orderId: Int) async throws {
        let deleteOrder = try await webService.deleteOrder(orderId: orderId)
        orders = orders.filter{$0.id != deleteOrder.id}
    }
    func updateOrder(_ order: Order) async throws{
        let updateOrder = try await webService.updateOrder(order)
        guard let index  = orders.firstIndex(where: {$0.id == updateOrder.id}) else {
            throw CoffeeOrderError.invalidOrderId
        }
        orders[index] = updateOrder
    }
}
