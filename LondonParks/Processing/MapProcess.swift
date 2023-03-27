//
//  MapProcess.swift
//  LondonParks
//
//  Created by Parsa Dev on 15/08/2022.
//
import SwiftUI


func gMap(latitude:Double, longitude:Double){
    

    let url = "comgooglemaps://?saddr=My+Location&daddr=\(latitude),\(longitude)"
    
    guard let url = URL.init(string: url)
            else { return }
        UIApplication.shared.open(url,options: [:])
        { (success) in
            print ("opening...")
        }
}


func appleMap(latitude:Double, longitude:Double){
    let url = URL(string: "maps://?saddr=My+Location&daddr=lon=\(latitude),\(longitude)")
    if UIApplication.shared.canOpenURL(url!) {
          UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
}
