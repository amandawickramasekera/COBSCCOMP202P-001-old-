//
//  SignUpView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-07.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    let gender = ["Male", "Female"]
    
    @StateObject var userModel = UserModel()
    
    //@State private var selectedGender = ""

    var body: some View {
        
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {})/*.background(LinearGradient(gradient: init(colors:[Color("top"), Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))*/.alert( isPresented: $userModel.alert, content: {
            Alert(title: Text("Message"), message: Text(userModel.alertMsg), dismissButton: .destructive(Text("Ok"), action: {
                
                if userModel.alertMsg == "Verification email sent, please verify your email"
                {
                    userModel.nic = ""
                    userModel.dob = Date()
                    userModel.gender = ""
                    userModel.name = ""
                    userModel.mobile = ""
                    userModel.email_Signup = ""
                    userModel.password_Signup = ""
                    userModel.reEnterPassword = ""
                    userModel.currLocation = ""
                }
            }))
        })
        NavigationView{
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
                
                TextField("Email", text: $userModel.email_Signup).autocapitalization(.none)
                
                SecureField("Password", text: $userModel.password_Signup).autocapitalization(.none)
                
                SecureField("Retype password", text: $userModel.reEnterPassword).autocapitalization(.none)
                
                TextField("Current location", text: $userModel.currLocation)
                
                
                ZStack{
                    Button(action: userModel.signUp){
            
                    NavigationLink(destination: SignInView()) {
                        Text("Sign up")
                    }
                }
            }
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
