//
//  order.swift
//  cookie2
//
//  Created by AM Student on 9/23/24.
//

import Foundation
import SwiftUI

class Order: ObservableObject {
    
    static let types = ["cookie", "CooOKIe"]
    
    @Published var type = 0
    @Published var quantity = 1
    @Published var powderSugar = false
    @Published var crumbTopping = false
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    @Published var cellPhone = ""
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                powderSugar = false
                crumbTopping = false
            }
        }
        
        
    }
}
