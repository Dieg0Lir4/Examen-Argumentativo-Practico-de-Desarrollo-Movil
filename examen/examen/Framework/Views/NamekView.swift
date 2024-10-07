//
//  NamekView.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import SwiftUI

struct NamekView: View {
    @StateObject private var viewModel = PlanetCharactersViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                if viewModel.isLoading {
                    ProgressView("Cargando personajes...")
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Personajes de Namek")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                            
                            ForEach(viewModel.characters) { character in
                                HStack {
                                    AsyncImage(url: URL(string: character.image)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(character.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Text("Raza: \(character.race)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        Text("Afiliación: \(character.affiliation)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                    .background(Color.black.ignoresSafeArea())
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchCharacters(for: 1) // ID de Namek en la API
            }
        }
    }
}

