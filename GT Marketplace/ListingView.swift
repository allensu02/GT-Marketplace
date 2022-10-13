//
//  ListingView.swift
//  GT Marketplace
//
//  Created by Rishi Aniga on 10/13/22.
//

import SwiftUI

struct ListingView: View {
    @State var username: String = ""
    @State private var value = 0
    @State private var priceToggle: Bool = false
    private let numberFormatter: NumberFormatter
    
    init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
    }
    var body: some View {
        VStack() {
            TextField("Title", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            HStack() {
                TextField("$0.00", value: $value, formatter: numberFormatter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()
                Toggle(
                    isOn: $priceToggle,
                    label: {
                    Text("Free")
                })
                    .toggleStyle(SwitchToggleStyle(tint: Color.purple))
            }
            
        }.padding()
    }
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView()
    }
}
