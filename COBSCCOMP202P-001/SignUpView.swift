//
//  SignUpView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-07.
//

import SwiftUI

struct SignUpView: View {
    
    let gender = ["Male", "Female"]
    
    @State private var selectedGender = ""
    
    var body: some View {
        VStack{
            Text("Sign up")
            Form{
                TextField("NIC", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Date of birth") })
                
                Picker(selection: $selectedGender,
                    label:
                    HStack {
                        TextField("Gender",text: $selectedGender)
                    }
            )
                    {
                        ForEach(gender, id: \.self) { gender in
                            Text(gender).tag(gender)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
        
                TextField("Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                
                TextField("Mobile", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                
                TextField("Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                
                SecureField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("Apple")/*@END_MENU_TOKEN@*/)
                
                SecureField("Retype password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("Apple")/*@END_MENU_TOKEN@*/)
                
                TextField("Current location", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                
                
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
