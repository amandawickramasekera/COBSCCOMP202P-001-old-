//
//  UserModel.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-09.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
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
    @Published var email_Signup = ""
    @Published var password_Signup = ""
    @Published var reEnterPassword = ""
    @Published var currLocation = ""
    @Published var password_Reset_Email = ""
    @Published var new_Mobile = ""
    
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
        if nic == "" || dob == Date() || gender == "" || name == "" || mobile == "" || email_Signup == "" || password_Signup == "" || reEnterPassword == "" || currLocation == ""
        {
            self.alertMsg = "Please fill all fields"
            self.alert.toggle()
            return
        }
        if password_Signup != reEnterPassword{
            self.alertMsg = "Passwords don't match"
            self.alert.toggle()
            return
        }
        
        Auth.auth().createUser(withEmail: email_Signup, password: password_Signup) { (result, err) in
            
            if err != nil
            {
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            
            
            result?.user.sendEmailVerification(completion: { (err) in
                
                if err != nil{
                    self.alertMsg = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.alertMsg = "Verification email sent, please verify your email"
                self.alert.toggle()
                
            })
        }
    }
    
    func logout()
    {
        do{
            try Auth.auth().signOut()
            return()
        }
            catch{
                self.alertMsg = "An exception occured, couldn't sign you out"
                self.alert.toggle()
        }
    }
    
}
