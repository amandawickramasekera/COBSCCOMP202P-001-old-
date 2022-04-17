//
//  ContentView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    
    let district = ["Kandy", "Matale", "Nuwara Eliya", "Ampara", "Batticaloa", "Trincomalee", "Anuradhapura", "Polonnaruwa", "Jaffna", "Kilinochchi", "Mannar", "Mullaitivu", "Vavuniya", "Kurunegala", "Puttalam", "Kegalle", "Ratnapura", "Galle", "Hambantota", "Matara", "Badulla", "Monaragala", "Colombo", "Gampaha", "Kalutara"]
    
    @State private var adModel = AdModel()

    var body: some View {
        NavigationView{
        VStack{
            Form{
            Picker(selection: $adModel.filter_ad_district,
                label:
                HStack {
                TextField("District", text: $adModel.filter_ad_district)
                }
        )
                {
                    ForEach(district, id: \.self) { district in
                        Text(district).tag(district)
                    }
                }.pickerStyle(WheelPickerStyle())
            
                Button("View ads in selected district") {
                    adModel.loadAdsInDistrict()
                }
            }
            
            List {
                VStack{
                
                    Text(adModel.ad_geo_Location)
                    Text(adModel.ad_price)
                    Text(adModel.ad_category)
                    Text(adModel.ad_landSize)
                    Text(adModel.ad_district)
                    Text(adModel.ad_town_village)
                 
                NavigationLink(destination: SignInView().navigationBarHidden(true)) {
                Text("Sign in to view entire ad")
                }
                }
                
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
