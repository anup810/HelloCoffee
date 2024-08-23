//
//  Order.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-08-22.
//

import Foundation
enum CoffeeSize: String,Codable,CaseIterable{
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}
struct Order: Codable, Identifiable, Hashable{
    var id: Int?
    var name: String
    var coffeeName: String
    var total: Double
    var size: CoffeeSize
}
