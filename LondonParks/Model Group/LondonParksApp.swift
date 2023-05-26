//
//  LondonParksApp.swift
//  LondonParks
//
//  Created by Parsa Shobany on 13/08/2022.
//

import SwiftUI

@main
struct LondonParkApp: App {
    @State private var showContent = false

    var body: some Scene {
        WindowGroup {
            if showContent {
                ContentView()
                    .transition(.move(edge: .leading))
                    .animation(.easeInOut(duration: 1))
                    .onAppear{
                        withAnimation(.linear(duration: 1)) {
                            showContent = true
                        }
                    }
            } else {
                WelcomeScreen()
                    .transition(.move(edge: .trailing))
                    .animation(.easeInOut(duration: 1))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.linear(duration: 1)) {
                                showContent = true
                            }
                        }
                    }
            }
        }
    }
}







