//
//  WebService.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-08-22.
//

import Foundation

enum NetworkError: Error{
    case badUrl
    case badRequest
    case decodingError
}

class WebService{
    private var baseURL: URL
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    func updateOrder(_ order: Order) async throws ->Order{
        guard let orderId = order.id else{
            throw NetworkError.badRequest
        }
        guard let url = URL(string: Endpoints.deleteOrder(orderId).path,relativeTo: baseURL) else {
            throw NetworkError.badUrl
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(order)
        
        let(data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        guard let updateOrder = try? JSONDecoder().decode(Order.self, from: data) else {
            throw NetworkError.decodingError
        }
        return updateOrder
        
    }
    
    func deleteOrder(orderId: Int) async throws ->Order{
        guard let url = URL(string: Endpoints.deleteOrder(orderId).path,relativeTo: baseURL) else {
            throw NetworkError.badUrl
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let(data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        guard let deletedOrder = try? JSONDecoder().decode(Order.self, from: data) else {
            throw NetworkError.decodingError
        }
        return deletedOrder
    }
        
    func placeOrder(order: Order) async throws -> Order{
        guard let url = URL(string: Endpoints.placeOrder.path, relativeTo: baseURL) else{
            throw NetworkError.badUrl
        }
        // Set up the POST request with the necessary headers and encode the order data into JSON
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(order)

        // Perform the request and wait for the response
        let (data, response) = try await URLSession.shared.data(for: request)

        // Ensure the response is an HTTP response and the status code is 200 (OK)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }

        // Attempt to decode the response data into a new `Order` object
        guard let newOrder = try? JSONDecoder().decode(Order.self, from: data) else {
            throw NetworkError.decodingError
        }

        // Return the newly created order
        return newOrder

    }
    func getOrders() async throws ->[Order]{
        // https://island-bramble.glitch.me/test/orders
        
        guard let url = URL(string: Endpoints.allOrders.path, relativeTo: baseURL) else {
            throw NetworkError.badUrl
        }
        let (data,response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            throw NetworkError.badRequest
        }
        guard let orders = try? JSONDecoder().decode([Order].self, from: data) else {
            throw NetworkError.decodingError
        }
        return orders
        
    }
}
