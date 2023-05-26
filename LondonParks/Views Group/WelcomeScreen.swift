//
//  WelcomeScreen.swift
//  LondonParks
//
//  Created by Parsa Dev on 23/05/2023.
// This page, the pfont size is responsive to the screen size

import SwiftUI
import Foundation

private let logoHeight = geometrySizes.ScreenH * 0.15

struct WelcomeScreen: View {
    var body: some View {
        VStack{
            Spacer()
            Text("EXPLORE")
            Text("LONDON")
            Text("PARKS")
            Spacer()
            HStack {
                VStack(alignment: .trailing){
                    Text("Designed by Parsa Dev")
                        .font(.pDSmallFont)
                    Text("PARSADEV.CO.UK")
                            .onTapGesture {
                                    UIApplication.shared.open(URL(string: "https://WWW.PARSADEV.CO.UK")!, options: [:])
                            }
                            .font(.pDSmallFont)
                }
                .frame(maxHeight: logoHeight,alignment: .bottom)
                Image("PD-Logo-Day")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: logoHeight)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.bottom)
            .padding(.horizontal)
        }
        .font(.pDLargeTitle)
    }
    
    
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
        WelcomeScreen()
            .previewDevice("iPhone 14 Pro Max")
            .previewDisplayName("iPhone 14 Pro Max")
    }
    
}
