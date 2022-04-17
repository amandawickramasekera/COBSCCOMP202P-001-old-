//
//  SellerAdView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-09.
//

import SwiftUI
import MapKit

struct SellerAdView: View {
    
    let category = ["Land", "House"]
   
    
    let district = ["Kandy", "Matale", "Nuwara Eliya", "Ampara", "Batticaloa", "Trincomalee", "Anuradhapura", "Polonnaruwa", "Jaffna", "Kilinochchi", "Mannar", "Mullaitivu", "Vavuniya", "Kurunegala", "Puttalam", "Kegalle", "Ratnapura", "Galle", "Hambantota", "Matara", "Badulla", "Monaragala", "Colombo", "Gampaha", "Kalutara"]
    
    
    
    @State private var changeLocationVM = ChangeLocationViewModel()
    @State private var adModel = AdModel()
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {})/*.background(LinearGradient(gradient: init(colors:[Color("top"), Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))*/.alert( isPresented: $changeLocationVM.showAlert, content: {
            Alert(title: Text("Message"), message: Text(changeLocationVM.alertMsg), dismissButton: .destructive(Text("Ok"), action: {
            }))
        })
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {})/*.background(LinearGradient(gradient: init(colors:[Color("top"), Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))*/.alert( isPresented: $adModel.alert, content: {
                Alert(title: Text("Message"), message: Text(adModel.alertMsg), dismissButton: .destructive(Text("Ok"), action: {
                }))
            })
        NavigationView{
            VStack{
                if #available(iOS 14.0, *) {
                    Map(coordinateRegion: $changeLocationVM.region).accentColor(Color(.systemPink)).onAppear{
                        changeLocationVM.checkIfLocationEnabled()
                    }
                } else {
                    TextField("Geo Location", text: $adModel.geo_Location)
                }
                Form{
                Button("Select images to upload") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                
                TextField("Price", text: $adModel.price)
                
                Picker(selection: $adModel.category,
                    label:
                    HStack {
                    TextField("Category",text: $adModel.category)
                    }
            )
                    {
                        ForEach(category, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                
                
                TextField("Land size", text: $adModel.landSize)
                
                Picker(selection: $adModel.district,
                    label:
                    HStack {
                    TextField("District",text: $adModel.district)
                    }
            )
                    {
                        ForEach(district, id: \.self) { district in
                            Text(district).tag(district)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
               
            
                    TextField("Town/village", text: $adModel.town_village).disableAutocorrection(true)
                
                Button("Post ad") {
                    adModel.postAd()
                    if adModel.alertMsg == "Ad posted successfully"
                    {
                        adModel.geo_Location = ""
                        adModel.price = ""
                        adModel.category = ""
                        adModel.landSize = ""
                        adModel.district = ""
                        adModel.town_village = ""
                    }
                }
                }
            }
        }
    }
}

struct SellerAdView_Previews: PreviewProvider {
    static var previews: some View {
        SellerAdView()
    }
}
