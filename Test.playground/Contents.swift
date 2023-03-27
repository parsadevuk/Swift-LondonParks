// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import SwiftUI
import CoreLocation

var text:String = """
This is firs pragraph.
This is second pragraph
"""

func parkImages(parkID: String) -> [Image] {
    var images: [Image] = []
    
    for i in 0..<100 {
        let index = String(format: "%02d", i)
        let imageName = "\(parkID)-\(index)"
        print("\(imageName)")
        
        if let _ = UIImage(named: imageName) {
            images.append(Image(imageName))
        } else {
            break
        }
    }
    if images.isEmpty {
        print("Eroor loading Images")
    }
    
    return images
    
}

parkImages(parkID: "1001")
