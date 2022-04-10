//
//  UserModel.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-09.
//

import Foundation

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
}
