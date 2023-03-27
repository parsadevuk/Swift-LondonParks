//
//  ContentView.swift
//  LondonParks
//
//  Created by Parsa Dev on 13/08/2022.
//

import SwiftUI
import Foundation
import UIKit


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
    }
}
