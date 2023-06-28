//
//  FullDetailsPage.swift
//  LondonParks
//
//  Created by Parsa Shobany on 16/08/2022.
//

import SwiftUI

struct FullDetailsPage: View {
    
    var parkNumber: Int
    init(parkNumber: Int? = nil) {
        self.parkNumber = parkNumber ?? 0
    }
    
    var body: some View {
        let variableColor : [Color] = [
            (Color(hex: parksData[parkNumber].colorSets[0])!),
            (Color(hex: parksData[parkNumber].colorSets[1])!),
            (Color(hex: parksData[parkNumber].colorSets[2])!)]
        let gradient = LinearGradient(gradient: Gradient(colors: [variableColor[0],variableColor[1]]), startPoint: .top, endPoint: .bottom)
        
        ScrollView {
            Image(parksData[parkNumber].imageName)
                .resizable()
                .frame(minWidth: UIScreen.screenWidth-30)
            Text(parksData[parkNumber].description)
                .padding(.horizontal,30)
            
            /// Fix Here///
            //Gallery(images: parkImages(parkID: "1001"))
                //.frame(minWidth: geometrySizes.galleryH,idealWidth: 400,)
                //.frame(width: geometrySizes.galleryH,height: geometrySizes.galleryH)
        }
        .padding(.horizontal,30)
        .navigationTitle(parksData[parkNumber].name)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: ContentView()) {
                    Text("<Back")
                        .foregroundColor(Color.black)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Wikipedia") {
                    print("Wikipedia Button")
                }
            }
        }
        .frame(maxWidth: UIScreen.screenWidth-10, maxHeight: UIScreen.screenHeight-10)
        .background(gradient)
        .background(.black)
    }
}

struct FullDetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        FullDetailsPage(parkNumber: 0)
            .previewDevice("iPhone 14 Pro Max")
    }
}


