//
//  SettingsView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-09.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        VStack{
        Text("NIC")
        Text("DOB")
        Text("Gender")
        Text("Name")
            HStack{
                Text("Mobile")
                Button("Change") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }
        Text("Email")
        Button("Change password") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            
            HStack{
        Text("Current location")
                Button("Change") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
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
