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
