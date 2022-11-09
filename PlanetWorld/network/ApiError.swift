//
//  ApiError.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-09.
//

enum ApiError: Error {
    case badRequest             //Status code 400
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}
