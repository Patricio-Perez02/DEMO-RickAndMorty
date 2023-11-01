//
//  CharactersView.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 31/10/2023.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.characters, id: \.id) { character in
                Text(character.name ?? "")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.orange)
            }
        }
        .onAppear {
            getCharacters()
        }
    }
    
    private func getCharacters() {
        Task {
            await viewModel.getCharacters()
        }
    }
}

#Preview {
    CharactersView()
}
