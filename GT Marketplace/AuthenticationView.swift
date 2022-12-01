//
//  AuthenticationView.swift
//  GT Marketplace
//
//  Created by Rishi Aniga on 11/8/22.
//

import SwiftUI
import Firebase

struct AuthenticationView: View {
    @State private var email = ""
    @State private var password = ""
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                Text("Create Account")
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
                    let text = email
                    let isValid = checkEmail(email: email)
                    if isValid == true {
                        register()
                    } else {
                        showAlert = true
                    }
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
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Email"),
                          message: Text("Try Again"),
                          primaryButton: .default(Text("OK")) {
                          },
                          secondaryButton: .cancel(Text("Cancel"))
                    )
                }.padding()
                .padding(.top)
                .offset(y: 100)
                
                Button {
                    login()
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
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func checkEmail(email: String) -> Bool {
        let indexOf = email.firstIndex(of: "@")
        if indexOf != nil {
            let dom = email.substring(from: indexOf!)
            return dom == "@gatech.edu"
        } else {
            return false
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
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
