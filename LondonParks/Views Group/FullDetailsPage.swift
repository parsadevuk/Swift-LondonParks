//
//  FullDetailsPage.swift
//  LondonParks
//
//  Created by Parsa Dev on 16/08/2022.
//

import SwiftUI

struct FullDetailsPage: View {
    var parkNumber: Int
    init(parkNumber: Int? = nil) {
        self.parkNumber = parkNumber ?? 0
    }

    var body: some View {
        let variableColor: [Color] = [
            (Color(hex: parksData[parkNumber].colorSets[0])!),
            (Color(hex: parksData[parkNumber].colorSets[1])!),
            (Color(hex: parksData[parkNumber].colorSets[2])!)]
        let gradient = coloringData(parkNumber: parkNumber)

        ScrollView {
            VStack {
                Image(parksData[parkNumber].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .padding(.top, 100)
                    .offset(y:-100)
                Spacer()
                HStack{
                    Text(parksData[parkNumber].name)
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading)
                    Spacer()
                }
                Spacer()
                Spacer()
                Text(parksData[parkNumber].description)
                    .padding(.horizontal, 30)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                Spacer()
                HStack(alignment: .center, spacing: 0){
                    Spacer()
                    Button(action: {
                        gMap(latitude: parksData[parkNumber].locationCoordinate.latitude, longitude: parksData[parkNumber].locationCoordinate.longitude)
                    }, label: {
                        Text("Google Map")
                        Image("icon-google-maps")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .leading)
                            .shadow(radius: 5)
                    })
                    .background(.white.opacity(0.5))
                    .cornerRadius(10)
                    Spacer()
                    Button(action: {
                        appleMap(latitude: parksData[parkNumber].locationCoordinate.latitude, longitude: parksData[parkNumber].locationCoordinate.longitude)
                    }, label:{
                        Text("Map")
                        Image("icon-apple-maps")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .leading)
                            .shadow(radius: 5)
                    })
                    .background(.white.opacity(0.5))
                    .cornerRadius(10)
                .padding(.trailing, 30)
                }
                //.background(.white.opacity(0.5))
                .frame(maxWidth: geometrySizes.screenW-100)
                .cornerRadius(10)
                GalleryView(parkNumber: parkNumber)
                    .cornerRadius(20)
                    .frame(maxWidth: geometrySizes.galleryW)
                    .aspectRatio(contentMode: .fill)
            }
            .frame(maxWidth: UIScreen.screenWidth)
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
        }
        .background(gradient)
    }
}

struct FullDetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        FullDetailsPage(parkNumber: 0)
            .previewDevice("iPhone 14 Pro Max")
    }
}



