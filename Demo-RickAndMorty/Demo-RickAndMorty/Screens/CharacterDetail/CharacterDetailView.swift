//
//  CharacterDetailView.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 01/11/2023.
//

import SwiftUI

struct CharacterDetailView: View {
    @EnvironmentObject var characterViewModel: CharactersViewModel
    var animation: Namespace.ID
    
    var body: some View {
        if characterViewModel.selectedCharacter != nil {
            VStack {
                Spacer().frame(height: 100)
                
                AsyncImage(url: URL(string: characterViewModel.selectedCharacter?.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay(alignment: .bottom) {
                            VStack(spacing: 0) {
                            
                                Text(characterViewModel.selectedCharacter?.name ?? "")
                                    .font(.system(size: 22, weight: .bold, design: .rounded))
                                
                                Text("\(characterViewModel.selectedCharacter?.status ?? "") - \(characterViewModel.selectedCharacter?.species ?? "")")
                                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                                
                                Spacer()
                                
                                Text("Last known location: ")
                                    .font(.system(size: 15, weight: .semibold, design: .default))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("\(characterViewModel.selectedCharacter?.location?.name ?? "")")
                                    .font(.system(size: 17, weight: .bold, design: .default))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                HStack {
                                    Text("Origin: \(characterViewModel.selectedCharacter?.origin?.name ?? "")")
                                        .font(.system(size: 11, weight: .regular, design: .serif))
                                    
                                    Spacer()
                                    
                                    if let created = characterViewModel.selectedCharacter?.created {
                                        Text("\(created.toDate().toString())")
                                            .font(.system(size: 11, weight: .regular, design: .serif))
                                    }
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .tint(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .frame(height: 150.0)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                            .offset(y: 150.0)
                        }
                    
                } placeholder: {
                    VStack {
                        Spacer()
                        ProgressView()
                            .tint(.blue)
                        Spacer()
                    }
                    .frame(width: 300, height: 300)
                }
                .matchedGeometryEffect(id: characterViewModel.selectedCharacter?.name ?? "", in: animation)
                .frame(width: 300, height: 300)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            characterViewModel.showCharacterDetail.toggle()
                            characterViewModel.selectedCharacter = nil
                        }
                    }
            )
            
        }
    }
}
