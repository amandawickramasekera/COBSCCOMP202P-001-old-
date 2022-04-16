//
//  ChangeLocationViewModel.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-15.
//

import Foundation
import MapKit
import SwiftUI

final class ChangeLocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate
{
    
    @State var showAlert = false
    @Published var alertMsg = ""
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.9271, longitude: 79.8612), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationEnabled()
    {
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            
        }
        else{
            
        }
    }
    
    func checkLocationAuthorization()
    {
        guard let locationManager = locationManager else {
            return
        }
        
        if #available(iOS 14.0, *) {
            switch locationManager.authorizationStatus{
            
        case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
        case .restricted:
                self.alertMsg = "Cannot access your location"
        case .denied:
                self.alertMsg = "Please allow this app to access location"
        case .authorizedAlways, .authorizedWhenInUse:
                
                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            
        @unknown default:
            break
            }
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        checkLocationAuthorization()
    }
}
