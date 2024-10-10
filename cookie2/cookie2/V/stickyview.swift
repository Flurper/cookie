//
//  stickyview.swift
//  cookie2
//
//  Created by AM Student on 9/16/24.
//

import SwiftUI

struct stickyview: View {

    @Binding var firstMinY: CGFloat
    @Binding var minY: CGFloat
    @Binding var lastMinY: CGFloat
    @Binding var scale: CGFloat

    @State var showInfoModalView = false

    var body: some View {

        GeometryReader { reader -> AnyView in

            let minY = reader.frame(in: .global).minY
            let progress = (minY > 0 ? minY : 0) / 200
            let scale = (1 - progress) * 1
            let imageScale = (scale / 0.6) > 0.9 ? (scale / 0.6) : 0.9
            let imageOffSet = imageScale > 0 ? (1 - imageScale) * 200 : 20

            DispatchQueue.main.async {
                if self.firstMinY == 0 {
                    self.firstMinY = minY
                }
                self.minY = minY

                if scale < 0.4 && lastMinY == 0 {
                    self.lastMinY = minY
                }
                self.scale = scale
            }
            return AnyView(
                Image("cookie1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: getScreen().width,
                        height: getScreen().height - firstMinY
                    )
                    .cornerRadius(1)
                    .scaleEffect(scale < 0.6 ? imageScale : 1)
                    .offset(y: scale < 0.3 ? imageOffSet : 0)
                    .overlay(

                        ZStack {
                            VStack {
                                Text("The grandmas consume all in the future")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                Text("Homemade Treat")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 10)
                            }
                            .foregroundColor(.white)
                            .offset(y: 15)
                            .opacity(Double(scale - 0.7 / 0.3))

                            Text("cookies")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .opacity(0.8)
                                .scaleEffect(1.5)
                                .opacity(0.1 - Double(scale - 0.7) / 0.3)
                        }
                    )
                    .background(
                        ZStack {
                            if scale < 0.6 {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("grandma"))

                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        ForEach(1...3, id: \.self) { _ in
                                            Circle()
                                                .fill(Color.gray)
                                                .frame(width:15, height: 15)
                                        }
                                    }
                                    Spacer()
                                }
                            }
                        }
                    )
                    .scaleEffect(scale > 0.6 ? scale : 0.6)
                    .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)
                    .offset(y:scale > 0.6 ? (scale - 1) * 200 : -80)
            )
        }
        .frame(width: getScreen().width, height: getScreen().height - firstMinY)
        .overlay(
            VStack {
                Text("Swipe Up to Order")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    showInfoModalView = true
                }, label: {
                    Label("Order", systemImage: "")
                        .background(Color.white)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding()
                        .border(Color.white, width: 16)
                })
                .padding()
            }
                .sheet(isPresented: $showInfoModalView) {
                    OrderForm()
                }
                .offset(y:minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0), alignment: .bottom
            )
    }
}

#Preview {
    homeview()
}
