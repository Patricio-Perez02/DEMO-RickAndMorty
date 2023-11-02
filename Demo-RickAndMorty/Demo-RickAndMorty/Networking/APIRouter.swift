//
//  APIRouter.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 26/10/2023.
//

import Foundation

enum APIRouter {
    case getCharacters(id: Int)
    
    var host: String {
        return Constants.Network.API_HOST
    }
    
    var scheme: String {
        return Constants.Network.API_SCHEME
    }
    
    var path: String {
        var apiPath = ""
        switch self {
        case .getCharacters:
            apiPath = "/character"
        }
        
        return "/api" + apiPath
    }
    
    var method: String {
        switch self {
        case .getCharacters:
            return "GET"
        }
    }
    
    var queryParams: [URLQueryItem]? {
        switch self {
        case .getCharacters(let id): 
            return [URLQueryItem(name: "page", value: "\(id)")]
        }
    }
}
