//
//  SwiftUIView.swift
//  GT Marketplace
//
//  Created by Yoon Ji Cho on 9/29/22.
//

import SwiftUI

struct SwiftUIView: View {
    private var numberOfImages = 4
    var body: some View {
        TabView {
            ForEach(0..<numberOfImages, id: \.self){ num in Image("\(num)")
                    .resizable()
                    .scaledToFit()
                    .tag(num)
                
            }
        }.tabViewStyle(PageTabViewStyle())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
