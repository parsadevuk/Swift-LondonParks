//
//  Computations.swift
//  LondonParks
//
//  Created by Parsa Shobany on 19/03/2023.
//

import Foundation
import UIKit


//This function will generate array of UIImage of each park (Picter set of park). Pictures should be uploaded to the Catalogue by this format "\(parkID)-\(index)" eg "1001-09"
func parkImages(parkID: String) -> [UIImage] {
    var images: [UIImage] = []
    for i in 0..<100 {
        let index = String(format: "%02d", i)
        let filename = "\(parkID)-\(index)"
        if let image = UIImage(named: filename) {
            images.append(image)
        }
    }
    return images
}
