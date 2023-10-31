//
//  APIRouter.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 26/10/2023.
//

import Foundation

enum APIRouter {
    case getCharacters
    
    var host: String {
        return Constants.Network.API_HOST
    }
    
    var scheme: String {
        return Constants.Network.API_SCHEME
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/api/character"
        }
    }
    
    var method: String {
        switch self {
        case .getCharacters:
            return "GET"
        }
    }
    
    var queryParams: [URLQueryItem]? {
        switch self {
        default:
            return nil
        }
    }
}
