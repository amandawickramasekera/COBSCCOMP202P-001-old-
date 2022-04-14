//
//  SettingsView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-09.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SettingsView: View {

    @State private var userModel = UserModel()
    @State private var isActive = false
    @State private var attemptingLogout = false
    
    var body: some View {
        NavigationView{
        VStack{
        Text("NIC")
        Text("DOB")
        Text("Gender")
        Text("Name")
            HStack{
                Text("Mobile")
                NavigationLink(destination: ChangeMobileView()) {
                    Text("Change")
                }
            }
        Text("Email")
            NavigationLink(destination: ResetPasswordView()) {
                Text("Change password")
            }
            
            HStack{
        Text("Current location")
                NavigationLink(destination: ChangeLocationView()) {
                    Text("Change")
                }
            }
            
            ZStack{
                NavigationLink(destination: ContentView().navigationBarHidden(true), isActive: $isActive) {
                    Button("Logout") {
                        attemptingLogout = true
                        userModel.logout()
                        if Auth.auth().currentUser == nil
                        {
                            self.isActive = true
                        }
                        else{
                            self.attemptingLogout = false
                        }
                    }
                }
            }
        }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
