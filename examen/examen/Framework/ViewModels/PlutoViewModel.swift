//
//  PlutoViewModel.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import Foundation

class PlutoViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var searchText: String = ""
    private let plutoRequirements = PlutoRequirements()
    private var currentPage = 1
    private let limit = 10
    private var isLoading = false
    
    // Propiedad computada para filtrar personajes según el texto de búsqueda
    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func fetchAllCharacter() async {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            let fetchedCharacters = try await plutoRequirements.retrieveAllCharacters(page: currentPage, limit: limit)
            DispatchQueue.main.async {
                self.characters.append(contentsOf: fetchedCharacters)
                self.currentPage += 1
            }
        } catch {
            print("Error in fetchAllCharacter: \(error)")
        }
        isLoading = false
    }
}
