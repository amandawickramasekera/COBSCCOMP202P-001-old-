//
//  ChangeLocationView.swift
//  COBSCCOMP202P-001
//
//  Created by Amanda Wickramasekera on 2022-04-14.
//

import SwiftUI
import MapKit

struct ChangeLocationView: View {
    
    @State private var changeLocationVM = ChangeLocationViewModel()
    @State private var userModel = UserModel()
    
    var body: some View {
        
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {})/*.background(LinearGradient(gradient: init(colors:[Color("top"), Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))*/.alert( isPresented: $userModel.alert, content: {
                Alert(title: Text("Message"), message: Text(changeLocationVM.alertMsg), dismissButton: .destructive(Text("Ok"), action: {
                }))
            })
        NavigationView{
            VStack{
                if #available(iOS 14.0, *) {
                    Map(coordinateRegion: $changeLocationVM.region).accentColor(Color(.systemPink)).onAppear{
                        changeLocationVM.checkIfLocationEnabled()
                    }
                } else {
                    TextField("New location", text: $userModel.new_Location)
                }
                Button("Save new location") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

struct ChangeLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLocationView()
    }
}
