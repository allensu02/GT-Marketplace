//
//  AuthenticationView.swift
//  GT Marketplace
//
//  Created by Rishi Aniga on 11/8/22.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                Text("New User")
                    .foregroundColor(.black)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: 0, y: -50)
                
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.black)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.black)
                Button {
                    //sign up
                } label: {
                    Text("Sign up")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 200, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                        )
                        .foregroundColor(.black)
                }
                .padding(.top)
                .offset(y: 100)
                
                Button {
                    //sign up
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
            }
            .frame(width: 350)
        }.ignoresSafeArea()
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
