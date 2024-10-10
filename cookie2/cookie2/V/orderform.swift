//
//  orderform.swift
//  cookie2
//
//  Created by AM Student on 9/23/24.
//

import SwiftUI
struct OrderForm: View {
    @ObservedObject var order = Order()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("select your cookie type", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper(value: $order.quantity, in: 1...20) {
                        Text("number of cookies: \(order.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("any special request")
                    }
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.powderSugar) {
                            Text("powerder")
                        }
                    }
                }
            }
        }
    }
}
