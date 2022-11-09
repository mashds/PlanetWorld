//
//  Extensions.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-09.
//

import Foundation
import UIKit

extension UIImageView {
    func makeRounded() {
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
