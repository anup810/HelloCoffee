//
//  OrderDetailsView.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-09-06.
//

import SwiftUI

struct OrderDetailsView: View {
    let orderId : Int
    @EnvironmentObject private var model : CoffeeModel
    @Environment(\.dismiss) private var dismiss

    @State private var isPresented: Bool = false
    private func deleteOrder() async{
        do{
            try await model.deleteOrder(orderId)
            dismiss()
        }catch{
            print(error)
        }
        
    }
    var body: some View {
        VStack{
            
            if let order = model.orderById(orderId){
                VStack(alignment:.leading,spacing: 10){
                    Text(order.coffeeName)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .accessibilityIdentifier("coffeeNameText")
                    Text(order.size.rawValue)
                        .opacity(0.5)
                    Text(order.total as NSNumber, formatter:  NumberFormatter.currency)
                    
                    HStack{
                        Spacer()
                        Button("Delete Order",role: .destructive){
                            Task{
                                await deleteOrder()
                            }
                        }
                        Button("Edit Order"){
                            isPresented = true
                            
                        }.accessibilityIdentifier("editOrderButton")
                        Spacer()
                    }
                }.sheet(isPresented: $isPresented, content: {
                    AddCoffeeView(order: order)
                })
                
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    var config = Configuration()
    return OrderDetailsView(orderId: 1)
        .environmentObject(CoffeeModel(webService: WebService(baseURL: config.environment.baseURL)))
}
