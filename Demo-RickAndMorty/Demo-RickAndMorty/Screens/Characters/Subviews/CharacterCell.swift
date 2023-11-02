//
//  CharacterCell.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 31/10/2023.
//

import SwiftUI

struct CharacterCell: View {
    let character: Character
    
    var body: some View {
            ZStack {
                VStack {
                    AsyncImage(url: URL(string: character.image ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(16, corners: [.topLeft, .topRight])
                        
                    } placeholder: {
                        VStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        .tint(.cyan)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Spacer()
                    
                    VStack {
                        Text(character.name ?? "")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(16, corners: [.bottomRight, .bottomLeft])

                }
            }
            .frame(height: 180)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
            )
            .padding()
    }
}

#Preview {
    CharacterCell(character: Character(id: 0, name: "Placeholder", status: "", species: "", type: "", gender: "", origin: NameUrlResponse(name: "", url: ""), location: NameUrlResponse(name: "", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [""], url: "", created: ""))
}
