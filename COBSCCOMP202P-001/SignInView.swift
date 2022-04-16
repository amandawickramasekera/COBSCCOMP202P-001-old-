//
//  SignInView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-07.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignInView: View {
    
    @StateObject var userModel = UserModel()
    @State private var isActive = false
    @State private var attemptingLogin = false
    var body: some View {
        
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {})/*.background(LinearGradient(gradient: init(colors:[Color("top"), Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))*/.alert( isPresented: $userModel.alert, content: {
                Alert(title: Text("Message"), message: Text(userModel.alertMsg), dismissButton: .destructive(Text("Ok"), action: {
                    
                    if Auth.auth().currentUser != nil
                    {
                    
                        userModel.email = ""
                        userModel.password = ""
                        
                        
                    }
                }))
            })
        NavigationView{
            VStack{
            Text("Sign in")
                Form{
                TextField("Username", text: $userModel.email).autocapitalization(.none)
                
                SecureField("Password", text: $userModel.password).autocapitalization(.none)
            
                    ZStack{
                        Button("Login") {
                            attemptingLogin = true
                            userModel.login()
                            if Auth.auth().currentUser != nil
                            {
                                self.isActive = true
                            }
                            else{
                                self.attemptingLogin = false
                            }
                        }
                        NavigationLink(destination: SignedInHomeView().navigationBarHidden(true), isActive: $isActive) {
                            
                    }
                    }
            
                }
        
            NavigationLink(destination: Text("Terms & Policy")) {
                Text("Terms & Policy")
            }
                
            NavigationLink(destination: SignUpView()) {
                Text("Sign up")
            }
                
            NavigationLink(destination: ResetPasswordView()) {
                Text("Forgot password")
            }
            
                
        }
        
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
