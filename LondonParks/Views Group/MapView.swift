//
//  MapView.swift
//  Landmarks
//
//  Created by Parsa Dev on 09/08/2022.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapView: View {

    var number : Int
    
    
//    init(number : Int!) {
//        self.number = number ?? 0
//    }
    

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D( latitude: 0.0, longitude: 0.0), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))


    var body: some View {
        VStack{
        Map(coordinateRegion: $region)
            .frame(width: 400, height: 400, alignment: .top)
        }
        .onAppear {  region = MKCoordinateRegion(center: CLLocationCoordinate2D( latitude: parksData[number].locationCoordinate.latitude, longitude: parksData[number].locationCoordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)) }
    }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(number: 1)
    }
}
