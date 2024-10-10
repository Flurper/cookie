//
//  AddressView.swift
//  cookie2
//
//  Created by AM Student on 9/24/24.

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip Code", text: $order.zip)
                TextField("Cell Phone", text: $order.cellPhone)
            }
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("checkout")
                }
            }
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}
#Preview {
    AddressView(order: Order())
}
