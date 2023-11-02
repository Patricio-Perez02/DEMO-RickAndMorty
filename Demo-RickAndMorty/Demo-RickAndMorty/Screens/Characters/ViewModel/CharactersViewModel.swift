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
    @Published private var _characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    @Published var searchText: String = ""
    private var service: CharacterServiceProtocol = CharacterService.shared
    var totalPages = 0
    var page: Int = 1

    func getCharacters() async {
        do {
            isLoading = true
            let characters = try await service.getCharacters(with: page)
            _characters.append(contentsOf: characters)
            isLoading = false
        } catch let error {
            self.error = error.localizedDescription
        }
    }
    
    
    func loadMoreCharacters(currentItem item: Character) async {
        let thresholdIndex = self._characters.index(self._characters.endIndex, offsetBy: -1)
        if thresholdIndex == item.id {
            page += 1
            await getCharacters()
        }
    }

    var characters: [Character] {
        if searchText.isEmpty {
            return _characters
        } else {
            return _characters.filter { $0.name?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }
}
