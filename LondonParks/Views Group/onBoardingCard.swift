//
//  onBoardingCard.swift
//  LondonParks
//
//  Created by Parsa Shobany on 14/08/2022.
//

import SwiftUI
import Foundation
import CoreLocation
import MapKit


struct onBoardingCard: View {
    var boarding = true
    let parkNumber : Int
    
    var body: some View {
        let varibleColor : [Color] = [
            (Color(hex: parksData[parkNumber].colorSets[0])!),
            (Color(hex: parksData[parkNumber].colorSets[1])!),
            (Color(hex: parksData[parkNumber].colorSets[2])!)]
        VStack{
            Spacer()
            ScrollView{
                Text(parksData[parkNumber].name)
                    .font(.largeTitle)
                    .bold()
                MapView(number: parkNumber)
                    .frame(maxWidth: geometrySizes.mapWidth ,maxHeight: geometrySizes.mapHeight, alignment: .center)
                    .ignoresSafeArea(edges: .top)
                    .cornerRadius(15)
                    .shadow(color: varibleColor[2], radius: 10)
                imageCircleTheme(imageName: Image(parksData[parkNumber].imageName), imageSize: geometrySizes.circleDiameter, ollw: 5, shRad: 5, cColor: varibleColor[2])
                    .offset(y:-90)
                    .padding(.bottom,-90)
                Divider()
                VStack(alignment: .leading){
                    Spacer()
                    Text("""
                    Borough: \(parksData[0].boroughs)
                    City: \(parksData[0].city)
                    """)
                    .font(.headline)
                    .padding(.leading, 20)
                    Spacer()
                    Divider()
                    HStack{
                        Text("About \(parksData[parkNumber].name)")
                            .font(.title3)
                            .bold()
                            .padding(.leading, 20)
                        Spacer()
                    }
                    Text(parksData[parkNumber].shortInfo)
                        .font(.body)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 10))
                        .multilineTextAlignment(.leading)
                    Divider()
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
                        .padding(.trailing, 30)}
                    HStack(alignment: .center){
                        Spacer()
                        NavigationLink(destination: FullDetailsPage(parkNumber: parkNumber)) {
                                           Text("Go to Detail View")
                                               .padding()
                                               .foregroundColor(.black)
                                               .cornerRadius(10)
                                       }
                        .padding(10)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        .background(Color(hex: "#e1e1e1"))
                        .cornerRadius(25)
                        Spacer()
                    }
                    Spacer()
                }
                .background()
                .cornerRadius(10)
                .frame(maxWidth: UIScreen.screenWidth - 60 , alignment: .center)
                
            }
            .tabViewStyle(PageTabViewStyle())
            .padding(.bottom, 30)
            //.padding(.horizontal,50)
            .frame( maxWidth: UIScreen.screenWidth-35, alignment: .center)
        }
        .background(LinearGradient(gradient: Gradient(colors: [varibleColor[0],varibleColor[1]]), startPoint: .top, endPoint: .bottom))
        .ignoresSafeArea(.all, edges: [ .bottom])
        .shadow(color: varibleColor[2], radius: 10)
        .cornerRadius(30, antialiased: true)
        .padding(.horizontal,20)
        //.frame(maxWidth: UIScreen.screenWidth - 40)
    }
}

struct onBoardingCard_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingCard(parkNumber: 1)
        
    }
}





