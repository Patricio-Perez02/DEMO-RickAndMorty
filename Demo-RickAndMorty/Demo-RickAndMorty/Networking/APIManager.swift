//
//  APIManager.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 26/10/2023.
//

import Foundation

protocol APIManagerProtocol {
    func request<T: Codable>(with router: APIRouter) async throws -> T
}

class APIManager: APIManagerProtocol {
    
    static let shared: APIManagerProtocol = APIManager()
    
    func request<T: Codable>(with router: APIRouter) async throws -> T {
        var components = URLComponents() // 1
        components.host = router.host
        components.scheme = router.scheme
        components.path = router.path
        
        if let queryParams = router.queryParams {
            components.queryItems = queryParams
        }
        
        guard let url = components.url else { throw APIError.badUrl } // 2
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        let session = URLSession(configuration: .default)
        return try await withCheckedThrowingContinuation { continuation in // 4
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    return continuation.resume(with: .failure(error))
                }
                
                guard let data = data else {
                    return continuation.resume(with: .failure(APIError.noData)) // 5
                }
                
                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async { // 6
                        return continuation.resume(with: .success(responseObject)) // 7
                    }
                } catch {
                    return continuation.resume(with: .failure(error))
                }
            }
            dataTask.resume()
        }
    }
}
