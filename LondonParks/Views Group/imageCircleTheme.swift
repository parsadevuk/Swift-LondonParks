//
//  imageCircleTheme.swift
//  LondonParks
//
//  Created by Parsa Dev on 13/08/2022.
//

import SwiftUI

struct imageCircleTheme: View {
    var imageName:Image
    var imageSize: CGFloat
    var ollw: CGFloat
    // ollw = Over Layer :ine Width
    var shRad: CGFloat
    // Shadow Radius
    var cColor: Color = .black
    
    var body: some View {
        imageName
            .resizable()
            .frame(width: imageSize, height: imageSize)
            .clipShape(Circle())
            .overlay(){
                Circle().stroke(cColor, lineWidth:ollw)
            }
            .shadow(radius: shRad)
    }
}

struct imageCircleTheme_Previews: PreviewProvider {
    static var previews: some View {
        imageCircleTheme(imageName: Image("turtlerock"), imageSize: 200, ollw: 5, shRad: 3, cColor: Color.yellow)
    }
}
