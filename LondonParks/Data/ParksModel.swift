//
//  ParksModel.swift
//  LondonParks
//
//  Created by Parsa Dev on 13/08/2022.
//https://www.cntraveller.com/gallery/parks-in-london
//https://www.londonxlondon.com/parks-in-london/



import Foundation
import SwiftUI
import CoreLocation

struct Parks2 : Hashable, Codable {
    var id : Int
    var name: String
    var parkType: String
    var boroughs: String
    var description: String
    var shortInfo: String
    var city: String
    var colorSets: [String]
    //Color set -- first two are gradiant color- 3rd one is frame color
    var isFeatured: Bool
    var isFavorite: Bool
    var gallery : [String]
    var imageName: String
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)}
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
