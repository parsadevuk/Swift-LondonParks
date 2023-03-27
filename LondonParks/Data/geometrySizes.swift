//
//  geometrySizes.swift
//  LondonParks
//
//  Created by Parsa Shobany on 30/08/2022.
//

import Foundation
import SwiftUI

struct geometrySizes {
    static let screenW = UIScreen.screenWidth
    static let ScreenH = UIScreen.screenHeight
    
    static let mapWidth = screenW - 60
    static let mapHeight = (ScreenH - 60)/3.5
    
    static let circleDiameter = (UIScreen.screenWidth - 60)/1.5

    static let galleryW = screenW - 50
    static let galleryH = ceil(galleryW/1.8)
}
