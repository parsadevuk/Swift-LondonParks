//
//  extensions.swift
//  LondonParks
//
//  Created by Parsa Dev on 15/08/2022.
//

import SwiftUI

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, opacity: a)
    }
}


func ColorSet(parkNumber: Int) -> (VariableColor: [Color], gradient: LinearGradient, SuggestedBackground: some View) {
    let variableColor: [Color] = [
        (Color(hex: parksData[parkNumber].colorSets[0])!),
        (Color(hex: parksData[parkNumber].colorSets[1])!),
        (Color(hex: parksData[parkNumber].colorSets[2])!)
    ]
    let systemBackground = Color(UIColor.systemBackground).opacity(0.3)
    let gradient = LinearGradient(
        gradient: Gradient(colors: [variableColor[0], variableColor[1]]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    let SuggestedBackground = gradient.background(systemBackground)
    
    return (VariableColor: variableColor, gradient: gradient, SuggestedBackground: SuggestedBackground)
}



extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
