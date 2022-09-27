//
//  ContentView.swift
//  GT Marketplace
//
//  Created by Allen Su on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, GT Marketplace")
                .padding()
                .font(.system(size: 40, weight: .bold, design: .default))
            Text("Triem Le")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(.cyan)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
