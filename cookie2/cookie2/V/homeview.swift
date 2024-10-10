//
//  homeview.swift
//  cookie2
//
//  Created by AM Student on 9/16/24.
//

import SwiftUI

struct homeview: View {
    @State var firstMinY: CGFloat = 0
    @State var minY: CGFloat = 0
    @State var lastMinY: CGFloat = 0
    @State var scale: CGFloat = 0
    var body: some View {
        VStack(spacing: 0) {
            
            HeaderView()
            
            ScrollView {
                stickyview(firstMinY: $firstMinY, minY: $minY, lastMinY: $lastMinY, scale: $scale)
                
                VStack(alignment: .leading, spacing: 15, content: {
                    Section(header: Text("Cookie with chip")
                        .font(.title)
                        .fontWeight(.bold)) {
                            Text("Its a cookie with chips in it")
                                .multilineTextAlignment(.center)
                        }
                })
                .padding()
                .padding(.bottom, lastMinY)
                .background(Color.white)
                .offset(y: scale > 0.4 ? minY: lastMinY)
            }
        }
        .ignoresSafeArea(.all)
        .background(Color("pops"))
        .ignoresSafeArea(.all, edges: .all)
    }
}
extension View {
    func getScreen() -> CGRect {
        return UIScreen.main.bounds
    }
}
    

#Preview {
    homeview()
}
