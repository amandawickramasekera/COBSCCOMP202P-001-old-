//
//  SignedInHomeView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-07.
//

import SwiftUI

struct SignedInHomeView: View {
    
    let category = ["Land", "House"]
    @State private var selectedCategory = ""
    
    var body: some View {
        VStack{
            Form{
                TextField("Min price", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                
                TextField("Max price", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                
                TextField("Radius from location", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                
                Picker(selection: $selectedCategory,
                    label:
                    HStack {
                        TextField("Category",text: $selectedCategory)
                    }
            )
                    {
                        ForEach(category, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
            
            
                Button("Filter Ads") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }
                
                List {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
                }
                
                Button("I want to sell") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            
            Button("Settings") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            
        }
    }
}

struct SignedInHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SignedInHomeView()
    }
}
