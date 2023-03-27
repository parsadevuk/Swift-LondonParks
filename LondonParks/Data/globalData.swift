//
//  profile.swift
//  LondonParks
//
//  Created by Parsa Dev on 30/08/2022.
//

import Foundation
import SwiftUI

var parkN : Int = 0
let invertPrimary : Color = Color(UIColor.systemBackground)

func coloringData(parkNumber: Int) -> LinearGradient {
    let variableColor: [Color] = [
        (Color(hex: parksData[parkNumber].colorSets[0])!),
        (Color(hex: parksData[parkNumber].colorSets[1])!),
        (Color(hex: parksData[parkNumber].colorSets[2])!)]
    let gradient = LinearGradient(gradient: Gradient(colors: [variableColor[0], variableColor[1]]), startPoint: .top, endPoint: .bottom)

    return gradient
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    init(configure: @escaping (UINavigationController) -> Void) {
        self.configure = configure
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let navigationController = uiViewController.navigationController {
            self.configure(navigationController)
        }
    }
}
