//
//  ApiRouter.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-09.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    //The endpoint name we'll call later
    case getPlanets(pageId: Int)
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try ConstantData.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        switch self {
            case .getPlanets(let pageId):
                let params = [ConstantData.Parameters.pageId : pageId]
                urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        
        return try encoding.encode(urlRequest, with: nil)
    }
    
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method: HTTPMethod {
        switch self {
        case .getPlanets:
            return .get
        }
    }
    
    //MARK: - Path
    //The path is the part following the base url
    private var path: String {
        switch self {
        case .getPlanets:
            return "planets"
        }
    }
}
