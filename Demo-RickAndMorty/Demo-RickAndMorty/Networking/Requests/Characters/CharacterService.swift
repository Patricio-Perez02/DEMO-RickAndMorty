//
//  CharacterService.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 31/10/2023.
//

import Foundation

protocol CharacterServiceProtocol {
    func getCharacters() async throws -> [Character]
}

class CharacterService: CharacterServiceProtocol {
    
    static let shared: CharacterServiceProtocol = CharacterService()
    
    func getCharacters() async throws -> [Character] {
        let response: CharactersResponse = try await APIManager.shared.request(with: .getCharacters)
        return response.data ?? []
    }
}
