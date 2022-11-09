//
//  AppFont.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-08.
//

import Foundation
import UIKit

private let familyName = "Poppins"

enum AppFont: String {
    case bold       = "Bold"
    case medium     = "Medium"
    case regular    = "Regular"
    case semiBold   = "SemiBold"

    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: fullFontName, size: size + 1.0) {
            return font
        }
        fatalError("Font '\(fullFontName)' does not exist.")
    }
    fileprivate var fullFontName: String {
        return rawValue.isEmpty ? familyName : familyName + "-" + rawValue
    }
}

