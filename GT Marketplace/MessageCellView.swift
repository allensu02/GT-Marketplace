//
//  MessageCellView.swift
//  GT Marketplace
//
//  Created by Mark Lau on 11/15/22.
//

import SwiftUI

struct MessageCellView: View {
    let name: String
    let message: String
    
    var body: some View {
        HStack {
            Text(name)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(message)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        
    }
}

struct MessageCellView_Previews: PreviewProvider {
    static var previews: some View {
        MessageCellView(name: "Mark", message: "HI")
    }
}
