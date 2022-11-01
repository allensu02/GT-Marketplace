//
//  ContentView.swift
//  GT Marketplace
//
//  Created by Allen Su on 9/27/22.
//  Modified by Atharva Gorantiwar on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 350)
            Text("Prom Dress")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(.black)
                .frame(maxWidth: 250, alignment: .leading)
            Text("$70")
                .frame(maxWidth: 250, alignment: .leading)
            Spacer()
                .frame(height: 50)
            HStack {
                Image("catphoto")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: 38.0, height: 38.0)
                    .cornerRadius(19)
                Text("Jane Doe")
                    .padding(.horizontal)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .frame(maxWidth: 200, alignment: .leading)
            }
            Text("This dress has only been worn once. It is in good condition.")
                .frame(maxWidth: 250, alignment: .leading)
            Text("#dress, #clothing")
                .frame(maxWidth: 250, alignment: .leading)
                .font(.system(size: 14, weight: .light, design: .default))
                .foregroundColor(.gray)
            Spacer()
                .frame(height: 75)
            Text("Pickup")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: 250, alignment: .leading)
            Text("Clough Undergraduate Learning Commons")
                .font(.system(size: 18))
                .frame(maxWidth: 250, alignment: .leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
