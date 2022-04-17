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
    @Published var new_Location = ""
    @Published var stringDOB = ""
    
    var settings_nic = ""
    var settings_dob = ""
    var settings_gender = ""
    var settings_name = ""
    var settings_mobile = ""
    var settings_email = ""
    var settings_location = ""
    
    @Published var alert = false
    @Published var alertMsg = ""
    
    let ref = Database.database().reference().child("NIBM Broker").child("Users")
    
    func login()
    {
        if email == "" || password == ""
        {
            self.alertMsg = "Please enter credentials"
            self.alert.toggle()
            return
        }

        Auth.auth().signIn(withEmail: email, password: password){ (result, err) in
            
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
            let user = Auth.auth().currentUser
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            self.stringDOB = dateFormatter.string(from: self.dob)
            self.ref.child(user!.uid).child("userId").setValue(user!.uid)
            self.ref.child(user!.uid).child("nic").setValue(self.nic)
            self.ref.child(user!.uid).child("dob").setValue(self.stringDOB)
            self.ref.child(user!.uid).child("gender").setValue(self.gender)
            self.ref.child(user!.uid).child("name").setValue(self.name)
            self.ref.child(user!.uid).child("mobile").setValue(self.mobile)
            self.ref.child(user!.uid).child("email").setValue(self.email_Signup)
            self.ref.child(user!.uid).child("currentLocation").setValue(self.currLocation)
            
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

    func resetPassword()
    {
        if password_Reset_Email == ""
        {
            self.alertMsg = "Please enter your email"
            self.alert.toggle()
        }
        else{
        Auth.auth().sendPasswordReset(withEmail: password_Reset_Email) { err in
            if err != nil{
                self.alertMsg = "An error occured"
                self.alert.toggle()
                
            }
            else{
                self.alertMsg = "Password reset email sent successfully"
                self.alert.toggle()
            }
        }
    }
    }
    
    func getUserData()
    {
        
        if let user = Auth.auth().currentUser
        {
            self.ref.child(user.uid).child("nic").observe(.value) { nic in
                
                self.settings_nic = nic.value as! String
                    
            } withCancel: { err in
                
                self.logout()
            }
            
            self.ref.child(user.uid).child("dob").observe(.value) { dob in
                
                self.settings_dob = dob.value as! String
                    
            } withCancel: { err in
                self.logout()
            }
            
            self.ref.child(user.uid).child("gender").observe(.value) { gender in
                
                self.settings_gender = gender.value as! String
                    
            } withCancel: { err in
                self.logout()
            }
            
            self.ref.child(user.uid).child("name").observe(.value) { name in
                
                self.settings_name = name.value as! String
                    
            } withCancel: { err in
                self.logout()
            }

            
            self.ref.child(user.uid).child("mobile").observe(.value) { mobile in
                
                self.settings_mobile = mobile.value as! String
                    
            } withCancel: { err in
                self.logout()
            }
            
            
            self.ref.child(user.uid).child("email").observe(.value) { email in
                
                self.settings_email = email.value as! String
                    
            } withCancel: { err in
                self.logout()
            }
            
            
            self.ref.child(user.uid).child("currentLocation").observe(.value) { currLocation in
                
                self.settings_location = currLocation.value as! String
                    
            } withCancel: { err in
                self.logout()
            }
            
            
        }
        
        else{
            self.logout()
        }
        
    }
    
    func saveNewMobile()
    {
        if let user = Auth.auth().currentUser
        {
            self.ref.child(user.uid).child("mobile").setValue(self.new_Mobile)
        }
    }
    
    func saveNewLocation()
    {
        if let user = Auth.auth().currentUser
        {
        if new_Location == ""
        {
            self.alertMsg = "Location is null"
            self.alert.toggle()
        }
        else{
            self.ref.child(user.uid).child("currentLocation").setValue(self.new_Location)
        }
        }
    }
}
