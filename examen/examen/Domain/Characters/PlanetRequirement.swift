//
//  PlanetRequirement.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import Foundation

struct PlanetRequirement {
    private let repository = PlanetRepository()
    
    func getCharactersForPlanet(id: Int) async throws -> [Character] {
        return try await repository.fetchCharactersForPlanet(id: id)
    }
}


