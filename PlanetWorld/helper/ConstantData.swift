//
//  ConstantData.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-08.
//

import Foundation
import UIKit

struct ConstantData {
    
    static var rowValue             = 6 // Loading animation type
    static var size                 = CGSize(width: 35, height: 35) // Loading animation size
    
    static var message              = "Please Wait"
    
    static var splash_time_delay    = 2.5
    
    static let black2               = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.9)
    
    //The API's base URL
    static let baseUrl              = "https://swapi.dev/api/"
    
    struct Parameters {
        static let pageId           = "page"
    }
    
}
