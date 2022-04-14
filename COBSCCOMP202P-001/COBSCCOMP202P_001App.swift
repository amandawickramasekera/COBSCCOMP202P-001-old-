//
//  COBSCCOMP202P_001App.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-02-07.
//

import SwiftUI
import Firebase
import FirebaseAuth

@available(iOS 14.0, *)
@main
struct COBSCCOMP202P_001App: App {
    
    @StateObject var userModel = UserModel()
    
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
        
            if Auth.auth().currentUser != nil
            {
                SignedInHomeView()
            }
            else{
                ContentView()
            }
        }
    }
}

class Delegate : NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
        FirebaseApp.configure()
        return true
    }
}
