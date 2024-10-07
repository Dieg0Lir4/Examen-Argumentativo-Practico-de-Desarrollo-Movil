//
//  PlanetaGenericoView.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import SwiftUI

struct PlanetaGenericoView: View {
    var planet: Planet
    @State private var characters: [Character] = []
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                if isLoading {
                    ProgressView("Cargando personajes...")
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            // Título del planeta
                            Text(planet.name)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                            
                            // Imagen del planeta
                            AsyncImage(url: URL(string: planet.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                            } placeholder: {
                                ProgressView()
                            }
                            .padding()
                            
                            // Descripción del planeta
                            if let description = planet.description {
                                Text(description)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .padding([.leading, .trailing, .bottom])
                            }
                            
                            // Lista de personajes en el planeta
                            ForEach(characters) { character in
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
                await loadPlanetCharacters()
            }
        }
    }
    
    func loadPlanetCharacters() async {
        do {
            let apiService = PlanetsAPIService()
            let characters = try await apiService.fetchCharactersForPlanet(id: planet.id)
            self.characters = characters
            self.isLoading = false
        } catch {
            print("Error al cargar los personajes: \(error)")
        }
    }
}
