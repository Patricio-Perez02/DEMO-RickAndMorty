//
//  CharactersViewModel.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 31/10/2023.
//

import Foundation

extension CharactersView {
    
    @MainActor
    final class CharactersViewModel: ObservableObject {
        @Published var characters: [Character] = []
        @Published var isLoading: Bool = false
        private var service: CharacterServiceProtocol = CharacterService.shared
        
        func getCharacters() async {
            do {
                isLoading = true
                characters = try await service.getCharacters()
                isLoading = false
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
    }
}
