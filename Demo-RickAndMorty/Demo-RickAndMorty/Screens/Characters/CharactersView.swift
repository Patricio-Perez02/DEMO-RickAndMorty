//
//  CharactersView.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 31/10/2023.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()
    @Namespace var animation
    private let columns = [ GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top, content: {
                
                if let error = viewModel.error {
                    ErrorView(messages: error)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 0, content: {
                            ForEach(Array(viewModel.characters.enumerated()), id: \.element) { index, character in
                                CharacterCell(character: character)
                                    .matchedGeometryEffect(id: character.name ?? "", in: animation)
                                    .onTapGesture {
                                        withAnimation {
                                            viewModel.selectedCharacter = character
                                            viewModel.showCharacterDetail.toggle()
                                        }
                                    }
                                    .onAppear {
                                        loadMoreCharacters(with: character)
                                    }
                            }
                        })
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scrollIndicators(.never)
                    
                    if viewModel.showCharacterDetail {
                        CharacterDetailView(animation: animation)
                            .environmentObject(viewModel)
                    }
                }
            })
            .onAppear {
                getCharacters()
            }
            .navigationTitle("Characters")
        }
        .searchable(text: $viewModel.searchText)
    }
    
    private func getCharacters() {
        Task {
            await viewModel.getCharacters()
        }
    }
    
    private func loadMoreCharacters(with currentItem: Character) {
        Task {
            await viewModel.loadMoreCharacters(currentItem: currentItem)
        }
    }
}

#Preview {
    CharactersView()
}
