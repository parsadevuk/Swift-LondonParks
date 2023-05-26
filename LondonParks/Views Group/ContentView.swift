//
//  ContentView.swift
//  LondonParks
//
//  Created by Parsa Shobany on 13/08/2022.
//

import SwiftUI
import Foundation



//struct ContentView: View {
//
//
//
//    let nElement = parksData.count - 1
//    //let im = loadImagesFromAssetFolder(folderName: "1001")
//
//    var body: some View {
//        TabView{
//            ForEach((0...nElement), id: \.self){
//                parkN in
//                onBoardingCard(parkNumber: parkN)
//                //Profile().parkN=item
//            }
//        }
//        .tabViewStyle(PageTabViewStyle())
//        //.onChange(of: item, perform: {parkNumberr=item})
//        //.onChange(of:parkN){parkN = parkN}
//    }
//}

import SwiftUI

struct ContentView: View {
    
    let nElement = parksData.count - 1
    
    var body: some View {
        NavigationView {
            TabView {
                ForEach((0...nElement), id: \.self) {
                    parkN in
                    onBoardingCard(parkNumber: parkN)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
        ContentView()
            .previewDevice("iPhone 14 Pro Max")
            .previewDisplayName("iPhone 14 Pro Max")
    }
}
