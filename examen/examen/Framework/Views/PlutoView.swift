//
//  PlutoView.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct PlutoView: View {
    @StateObject private var viewModel = PlutoViewModel()
    
    var body: some View {
        VStack {
            // Barra de búsqueda vinculada al ViewModel
            TextField("Buscar por nombre", text: $viewModel.searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.top)
            
            // Lista de personajes filtrados
            List(viewModel.filteredCharacters) { character in
                HStack {
                    // Cargar la imagen usando AsyncImage
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading) {
                        // Nombre del personaje
                        Text(character.name)
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        // Información adicional
                        Text("Ki Máximo: \(character.maxKi)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Raza: \(character.race)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Género: \(character.gender)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Afiliación: \(character.affiliation)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .onAppear {
                    // Llamar a la función para cargar más personajes cuando llegue al final de la lista
                    if character == viewModel.characters.last {
                        Task {
                            await viewModel.fetchAllCharacter()
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .background(Color.white)
        .onAppear {
            Task {
                await viewModel.fetchAllCharacter()
            }
        }
    }
}
