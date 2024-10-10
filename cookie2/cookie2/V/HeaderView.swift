//
//  HeaderView.swift
//  cookie2
//
//  Created by AM Student on 9/16/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "cat")
                    .font(.title2)
                    .foregroundColor(.white)
            })
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "dog")
                    .font(.title2)
                    .foregroundColor(.white)
            })
        }
        .padding()
        .overlay(
        Text("Cookie Stock.co")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
        )
//        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .padding(.top, getSafeAreaInsets()?.top ?? 0)
        .background(Color("grandma"))
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 0)
    }
    private func getSafeAreaInsets() -> UIEdgeInsets? {
        let connectedScenes = UIApplication.shared.connectedScenes
        let windowScene = connectedScenes.first { $0 is UIWindowScene } as?
        UIWindowScene
        
        return windowScene?.windows.first?.safeAreaInsets
    }
}
#Preview {
    HeaderView()
}
