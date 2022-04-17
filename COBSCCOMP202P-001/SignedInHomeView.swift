//
//  SignedInHomeView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-07.
//

import SwiftUI

struct SignedInHomeView: View {
    
    @State private var adModel = AdModel()
    
    let category = ["Land", "House"]
 
    
    var body: some View {
        NavigationView{
        VStack{
            Form{
                TextField("Min price", text: $adModel.minPrice)
                
                TextField("Max price", text: $adModel.minPrice)
                
                TextField("Radius from location", text: $adModel.radiusFromLocation)
                
                Picker(selection: $adModel.filter_category,
                    label:
                    HStack {
                    TextField("Category",text: $adModel.filter_category)
                    }
            )
                    {
                        ForEach(category, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
            
            
                Button("Filter Ads") {
                    adModel.filterAds()
                }
            }
                
                List {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
                }
                
                NavigationLink(destination: SellerAdView())
            {
                Text("I want to sell")
            }
            
           
                NavigationLink(destination: SettingsView()) { Text("Settings") }
            }
            
        }
    }
}

struct SignedInHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SignedInHomeView()
    }
}
