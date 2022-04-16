//
//  ChangeMobileView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-14.
//

import SwiftUI

struct ChangeMobileView: View {
    
    @State private var userModel = UserModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    TextField("New mobile number", text: $userModel.new_Mobile)
                    
                    Button("Update") {
                        userModel.saveNewMobile()
                    }
                }
            }
        }
    }
}

struct ChangeMobileView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeMobileView()
    }
}
