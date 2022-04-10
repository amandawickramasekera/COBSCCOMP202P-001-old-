//
//  SignUpView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-07.
//

import SwiftUI

struct SignUpView: View {
    
    let gender = ["Male", "Female"]
    
    @StateObject var userModel = UserModel()
    
    //@State private var selectedGender = ""

    var body: some View {
        VStack{
            Text("Sign up")
            Form{
                TextField("NIC", text: $userModel.nic)
                
                DatePicker(selection: $userModel.dob, label: { Text("Date of birth") })
                
                Picker(selection: $userModel.gender,
                    label:
                    HStack {
                    TextField("Gender",text: $userModel.gender)
                    }
            )
                    {
                        ForEach(gender, id: \.self) { gender in
                            Text(gender).tag(gender)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
        
                TextField("Name", text: $userModel.name)
                
                TextField("Mobile", text: $userModel.mobile)
                
                TextField("Email", text: $userModel.email)
                
                SecureField("Password", text: $userModel.password)
                
                SecureField("Retype password", text: $userModel.password)
                
                TextField("Current location", text: $userModel.currLocation)
                
                
                Button("Sign up") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
