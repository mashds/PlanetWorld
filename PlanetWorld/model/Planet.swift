//
//  Planet.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-09.
//

import Foundation

struct Planets: Codable {
    let count           : Int?
    let next            : String?
    let previous        : String?
    let results         : [Planet]
}

struct Planet: Codable {
    let name            : String?
    let rotation_period : String?
    let orbital_period  : String?
    let diameter        : String?
    let climate         : String?
    let gravity         : String?
    let terrain         : String?
    let surface_water   : String?
    let population      : String?
}

