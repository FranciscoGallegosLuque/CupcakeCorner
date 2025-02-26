//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Francisco Manuel Gallegos Luque on 10/02/2025.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                        .onAppear {
                            let addressItems = [order.name, order.streetAddress, order.city, order.zip]
                            if let encoded = try? JSONEncoder().encode(addressItems) {
                                UserDefaults.standard.set(encoded, forKey: "addressItems")
                            }
                        }
                }
            }
            .disabled(order.hasValidAddress == false)
        }
    }
}

#Preview {
    AddressView(order: Order())
}
