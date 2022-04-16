//
//  ResetPasswordView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-14.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ResetPasswordView: View {
    
    @State private var userModel = UserModel()
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {})/*.background(LinearGradient(gradient: init(colors:[Color("top"), Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))*/.alert( isPresented: $userModel.alert, content: {
        Alert(title: Text("Message"), message: Text(userModel.alertMsg), dismissButton: .destructive(Text("Ok"), action: {
            
            if userModel.alertMsg == "Password reset email sent successfully"
            {
                userModel.password_Reset_Email = ""
            }
        }))
    })
        NavigationView{
            VStack{
                Text("Reset password")
                Form{
                    TextField("Email", text: $userModel.password_Reset_Email).autocapitalization(.none)
                
                    
                    Button("Send email to reset password") {
                        userModel.resetPassword()
                    }
                }
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
