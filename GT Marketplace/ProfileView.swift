//
//  ProfileView.swift
//  GT Marketplace
//
//  Created by Alyssa Zhu on 9/29/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(
           spacing: 20
        ) {
               Image("profilepic")
                   .resizable()
                   .clipShape(Circle())
                   .frame(width: 100, height: 100)
                Text("First Last")
               
               HStack(
                       alignment: .center,
                       spacing: 50
               ) {
                   Button("Phone") {
                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                   }.buttonStyle(.borderedProminent)

                   Button("Email") {
                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                   }.buttonStyle(.borderedProminent)
               }
            
            VStack(
                alignment: .leading,
                spacing: 7
            ) {
                Text("Seller Description")
                    .fontWeight(.bold)
                
                Text("Seller Description (location, ....)")
                    .fontWeight(.light)
                    .frame(alignment: .leading)
                    .multilineTextAlignment(.leading)
                   
            }
            Spacer()
           }
        
            
            
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
