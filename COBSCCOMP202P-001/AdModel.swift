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

    @Published var alert = false
    @Published var alertMsg = ""
    
    @Published var filter_ad_district = ""
    
    @Published var ad_geo_Location = ""
    //@Published var ad_image: Image!
    @Published var ad_price = ""
    @Published var ad_category = ""
    @Published var ad_landSize = ""
    @Published var ad_district = ""
    @Published var ad_town_village = ""

    @Published var default_district_ad_list = [AdModel]()
    
    let ref = Database.database().reference().child("NIBM Broker").child("Ads")
    
    
    @Published var minPrice = ""
    @Published var maxPrice = ""
    @Published var radiusFromLocation = ""
    @Published var filter_category = ""
    
    
    
    func postAd()
    {
        if Auth.auth().currentUser != nil
        {
            
            if /*self.geo_Location == "" || */ self.price == "" || self.category == "" || self.landSize == "" || self.district == "" || self.town_village == ""
            {
                self.alertMsg = "Please fill all fields"
                self.alert.toggle()
                return
            }
            
            guard let key = ref.childByAutoId().key else {
                
                self.alertMsg = "Couldn't post ad"
                self.alert.toggle()
                return
                
            }

            self.ref.child(self.district).child(key).child("geoLocation").setValue("")
            
            self.ref.child(self.district).child(key).child("imageUrl").setValue("")
            
            self.ref.child(self.district).child(key).child("price").setValue(self.price)
            
            self.ref.child(self.district).child(key).child("category").setValue(self.category)
            
            self.ref.child(self.district).child(key).child("landSize").setValue(self.landSize)
            
            self.ref.child(self.district).child(key).child("district").setValue(self.district)
                
            self.ref.child(self.district).child(key).child("townOrVillage").setValue(self.town_village)
            
            self.alertMsg = "Ad posted successfully"
            self.alert.toggle()
            return
        }
    }
    
    
    func loadAdsInDistrict()
    {
        
        self.ref.child(self.filter_ad_district).observe(.value) { snapshot in
            
            self.default_district_ad_list.removeAll()
            
            for ads in snapshot.children.allObjects as! [DataSnapshot]
            {
                let adObject = ads.value as? [String: AnyObject]
                
                self.ad_geo_Location = adObject?["geoLocation"] as! String
                self.ad_price = adObject?["price"] as! String
                self.ad_category = adObject?["category"] as! String
                self.ad_landSize = adObject?["landSize"] as! String
                self.ad_district = adObject?["district"] as! String
                self.ad_town_village = adObject?["townOrVillage"] as! String
                
                let ad = AdModel()
                
                self.default_district_ad_list.append(ad)
            }
            
        }
    }
    
    func filterAds()
    {
        
    }
}
