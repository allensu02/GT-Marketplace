//
//  ContentView.swift
//  GT Marketplace
//
//  Created by Allen Su on 9/27/22.
//  Modified by Atharva Gorantiwar on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    @State var productName: String = ""
    var body: some View {
        ChatContentView(messagesManager: MessagesManager())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
