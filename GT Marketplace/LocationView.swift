//
//  LocationView.swift
//  GT Marketplace
//
//  Created by Rishi Aniga on 11/1/22.
//

import SwiftUI
import MapKit
import UIKit

struct LocationView: View {
   @StateObject private var mapAPI = MapAPI()
   @State private var text = ""
   
   var body: some View {
      VStack {
         TextField("Enter an address", text: $text)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
         
         Button("Find address") {
            mapAPI.getLocation(address: text, delta: 0.5)
         }
         
         Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations) { location in
            MapMarker(coordinate: location.coordinate, tint: .blue)
         }
         .ignoresSafeArea()
      }
   }
}

struct LocationView_Previews: PreviewProvider {
   static var previews: some View {
      LocationView()
   }
}
