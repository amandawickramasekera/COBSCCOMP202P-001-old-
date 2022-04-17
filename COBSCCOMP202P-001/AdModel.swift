//
//  AdModel.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-13.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SwiftUI

class AdModel : ObservableObject
{
    @Published var geo_Location = ""
    @Published var image:Image!
    @Published var price = ""
    @Published var category = ""
    @Published var landSize = ""
    @Published var district = ""
    @Published var town_village = ""
    
    @Published var minPrice = ""
    @Published var maxPrice = ""
    @Published var radiusFromLocation = ""
    @Published var filter_category = ""
    
    @Published var alert = false
    @Published var alertMsg = ""
    
    let ref = Database.database().reference().child("NIBM Broker").child("Ads")
    
    func postAd()
    {
        if let user = Auth.auth().currentUser
        {
            
            if /*self.geo_Location == "" || */ self.price == "" || self.category == "" || self.landSize == "" || self.district == "" || self.town_village == ""
            {
                self.alertMsg = "Please fill all fields"
                self.alert.toggle()
                return
            }
            self.ref.child(user.uid).child("Ad: \(town_village)").child("geoLocation").setValue("")
            
            self.ref.child(user.uid).child("Ad: \(town_village)").child("imageUrl").setValue("")
            
            self.ref.child(user.uid).child("Ad: \(town_village)").child("price").setValue(self.price)
            
            self.ref.child(user.uid).child("Ad: \(town_village)").child("category").setValue(self.category)
            
            self.ref.child(user.uid).child("Ad: \(town_village)").child("landSize").setValue(self.landSize)
            
            self.ref.child(user.uid).child("Ad: \(town_village)").child("district").setValue(self.district)
                
            self.ref.child(user.uid).child("Ad: \(town_village)").child("townOrVillage").setValue(self.town_village)
            
            self.alertMsg = "Ad posted successfully"
            self.alert.toggle()
            return
        }
    }
}
