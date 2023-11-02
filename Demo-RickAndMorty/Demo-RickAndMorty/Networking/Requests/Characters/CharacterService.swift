//
//  CharacterService.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 31/10/2023.
//

import Foundation

protocol CharacterServiceProtocol {
    func getCharacters(with page: Int) async throws -> [Character]
}

class CharacterService: CharacterServiceProtocol {
    
    static let shared: CharacterServiceProtocol = CharacterService()
    
    func getCharacters(with page: Int) async throws -> [Character] {
        let response: CharactersResponse = try await APIManager.shared.request(with: .getCharacters(id: page))
        return response.data ?? []
    }
}
