//
//  ContentView.swift
//  GT Marketplace
//
//  Created by Allen Su on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Text("Hello, GT Marketplace")
//                .padding()
//                .font(.system(size: 40, weight: .bold, design: .default))
//            Text("Shreya Malpani")
//                .font(.system(size: 30, weight: .bold, design: .default))
//                .foregroundColor(.cyan)
//
//        }
        
        ItemTileView(item: Item(name: "GT Hoodie", description: "Yellow Georgia Tech Hoodie, Size M", likes: 2, comments: 0, isFavorited: false))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
