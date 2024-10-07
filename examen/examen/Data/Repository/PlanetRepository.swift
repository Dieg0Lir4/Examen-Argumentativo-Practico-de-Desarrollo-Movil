//
//  PlanetRepository.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import Foundation

struct PlanetRepository {
    private let apiService = PlanetsAPIService()
    
    func fetchCharactersForPlanet(id: Int) async throws -> [Character] {
        return try await apiService.fetchCharactersForPlanet(id: id)
    }
}
