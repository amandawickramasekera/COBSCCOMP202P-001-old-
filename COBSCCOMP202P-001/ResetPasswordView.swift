//
//  ResetPasswordView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-14.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @State private var userModel = UserModel()
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    TextField("Email", text: $userModel.password_Reset_Email).autocapitalization(.none)
                    
                    Button("Send email") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
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
