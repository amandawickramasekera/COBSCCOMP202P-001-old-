//
//  UserModel.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-09.
//

import Foundation
import Firebase
import FirebaseAuth
import SwiftUI

class UserModel : ObservableObject
{
    @Published var nic = ""
    @Published var dob = Date()
    @Published var gender = ""
    @Published var name = ""
    @Published var mobile = ""
    @Published var email = ""
    @Published var password = ""
    @Published var currLocation = ""
    
    @Published var alert = false
    @Published var alertMsg = ""
    
    //@AppStorage("log_Status") var status = false
    
    func login()
    {
        if email == "" || password == ""
        {
            self.alertMsg = "Please enter credentials"
            self.alert.toggle()
            return
        }
        Auth.auth().signIn(withEmail: email, password: password){ (_: AuthDataResult?, err) in
            
            if err != nil
            {
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            let user = Auth.auth().currentUser
            
            if !user!.isEmailVerified{
                
                self.alertMsg = "Please verify email address"
                self.alert.toggle()
                do{
                    try Auth.auth().signOut()
                    return
                }
                catch{
                
                    self.alertMsg = "Couldn't sign you out"
                    return
                }
            }
           // self.status = true
        }
    }
    
    func signUp()
    {
        
    }
}
