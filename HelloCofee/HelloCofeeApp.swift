//
//  HelloCofeeApp.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-08-22.
//

import SwiftUI

@main
struct HelloCofeeApp: App {
    
    @StateObject private var model: CoffeeModel
    init(){
        var config  = Configuration()
        let webservice = WebService(baseURL: config.environment.baseURL)
        _model = StateObject(wrappedValue: CoffeeModel(webService: webservice))
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
