//
//  LoginView.swift
//  GT Marketplace
//
//  Created by Shreya Malpani on 11/8/22.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email,
                    password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
}

struct MainView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                ListingView()
            } else {
                LoginView()
            }
        }.onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}



struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signIn(email: email, password: password)
                }, label: {
                    Text("Login")
                        .foregroundColor(Color.white)
                        .padding(10)
                        .frame(width: 105, height: 45)
                        .background(Color.blue)
                        .cornerRadius(15)
                })
                
                Text("New to GT Marketplace? ")
                NavigationLink("Sign Up") {
                    
                }
                .foregroundColor(.blue)
                Spacer()
            }
            .navigationTitle("Login")
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
