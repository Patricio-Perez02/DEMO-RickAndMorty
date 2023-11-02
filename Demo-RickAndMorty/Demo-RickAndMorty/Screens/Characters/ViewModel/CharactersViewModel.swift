//
//  CharactersViewModel.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 31/10/2023.
//

import Foundation

@MainActor
final class CharactersViewModel: ObservableObject {
    @Published var showCharacterDetail: Bool = false
    @Published var selectedCharacter: Character? = nil
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    private var service: CharacterServiceProtocol = CharacterService.shared
    
    func getCharacters() async {
        do {
            isLoading = true
            characters = try await service.getCharacters()
            isLoading = false
        } catch let error {
            self.error = error.localizedDescription
        }
    }
}
