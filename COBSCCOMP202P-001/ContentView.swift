//
//  ContentView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    
    let district = ["Kandy", "Matale", "Nuwara Eliya", "Ampara", "Batticaloa", "Trincomalee", "Anuradhapura", "Polonnaruwa", "Jaffna", "Kilinochchi", "Mannar", "Mullaitivu", "Vavuniya", "Kurunegala", "Puttalam", "Kegalle", "Ratnapura", "Galle", "Hambantota", "Matara", "Badulla", "Monaragala", "Colombo", "Gampaha", "Kalutara"]
    
    @State private var selectedDistrict = ""
    
    var body: some View {
        NavigationView{
        VStack{
            Picker(selection: $selectedDistrict,
                label:
                HStack {
                    TextField("District",text: $selectedDistrict)
                }
        )
                {
                    ForEach(district, id: \.self) { district in
                        Text(district).tag(district)
                    }
                }
                .pickerStyle(WheelPickerStyle())
           
            List {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
