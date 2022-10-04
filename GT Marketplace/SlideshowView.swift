//
//  SwiftUIView.swift
//  GT Marketplace
//
//  Created by Yoon Ji Cho on 9/29/22.
//

import SwiftUI

struct SwiftUIView: View {
    private var numberOfImages = 4
    private  let timer = Timer.publish(every: 3, on:
            .main, in: .common).autoconnect()
    @State private var currentIndex = 0;
    
    func previous() {
        withAnimation {
            currentIndex = currentIndex > 0 ? currentIndex
            - 1 : numberOfImages - 1
        }
    }
    
    func next() {
        withAnimation {
            currentIndex = currentIndex <
                numberOfImages ? currentIndex + 1 :
            0
        }
    }
    
    var controls: some View {
        HStack {
            Button {
                previous()
            } label: {
                Image(systemName: "chevron.left")
            }
            
            Button {
                next()
            } label: {
                Image(systemName: "chevron.left")
            }
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                TabView(selection: $currentIndex) {
                    ForEach(1..<numberOfImages + 1, id: \.self){ num in
                        Image("\(num)")
                            .resizable()
                            .scaledToFit()
                            .overlay(Color.black.opacity(0.4))
                            .tag(num)
                        
                    }
                }.tabViewStyle(PageTabViewStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding()
                    .frame(width: proxy.size.width, height:
                            proxy.size.height / 3)
                    .onReceive(timer, perform: { _ in
                        next()
                    })
                controls
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
