//
//  PlanetsViewModel.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import Foundation

class PlanetCharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = true
    private let requirement = PlanetRequirement()
    
    func fetchCharacters(for planetId: Int) async {
        do {
            let characters = try await requirement.getCharactersForPlanet(id: planetId)
            DispatchQueue.main.async {
                self.characters = characters
                self.isLoading = false
            }
        } catch {
            print("Error fetching characters for planet: \(error)")
        }
    }
}
