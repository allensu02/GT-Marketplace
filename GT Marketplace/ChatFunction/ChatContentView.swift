//
//  ChatContentView.swift
//  GT Marketplace
//
//  Created by Max Ko on 11/8/22.
//

import SwiftUI

struct ChatContentView: View {
    
    @StateObject var messagesManager = MessagesManager()

    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollView {
                    ForEach(messagesManager.messages, id: \.id) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners:[.topLeft, .topRight])
            }
            .background(Color("Peach"))
            
            MessageField()
        }
    }
}

struct ChatContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatContentView()
    }
}
