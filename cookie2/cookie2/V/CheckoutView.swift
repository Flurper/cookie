//
//  CheckoutView.swift
//  cookie2
//
//  Created by AM Student on 9/24/24.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Text("Thank you for your order")
    }
}
#Preview {
    CheckoutView(order: Order())
}
