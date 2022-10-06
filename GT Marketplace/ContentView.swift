//
//  ContentView.swift
//  GT Marketplace
//
//  Created by Allen Su on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    @State var productName: String = ""
    var body: some View {
            NavigationView {
                VStack(alignment: .center, spacing: 90) {
                    Form {
                        TextField("Name", text:$productName)
                    }
                }
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Add Item")

            }
        VStack {
            Text("Hello, GT Marketplace")
                .padding()
                .font(.system(size: 40, weight: .bold, design: .default))

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
