//
//  MapView.swift
//  Landmarks
//
//  Created by Parsa Shobany on 09/08/2022.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapView: View {

    var number : Int = 0
    @State private var region: MKCoordinateRegion?
    
    init(number: Int, region: MKCoordinateRegion? = nil) {
        self.number = number
        self.region = region
    }


    var body: some View {
        VStack{

        Map()
            {
                Marker("🎡🎠\(parksData[number].name)🎢🍭🥨", coordinate: CLLocationCoordinate2D(
                    latitude:parksData[number].coordinates.latitude,
                    longitude:parksData[number].coordinates.longitude))
                
            }
            .mapControls {
                MapScaleView()
            }
            
            .frame(width: 400, height: 400, alignment: .top)
        }
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(number: 0)
    }
}
