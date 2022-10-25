//
//  ImageSwipeView.swift
//  GT Marketplace
//
//  Created by Max Ko on 10/4/22.
//

import SwiftUI

struct ImageSwipeView: View {
    public var numOfImage : Int

    var body: some View {
        GeometryReader { proxy in
            VStack {
                TabView {
                    ForEach(0..<numOfImage, id: \.self) {
                        num in Image(String(num + 1))
                            .resizable()
                            .scaledToFill()
                            .tag(num)
                    }
                }.tabViewStyle(PageTabViewStyle())
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding()
                .frame(width: proxy.size.width, height: proxy.size.height / 3, alignment: .center)
            }
        }
        
    }
}

struct ImageSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSwipeView(numOfImage : 5)
    }
}
