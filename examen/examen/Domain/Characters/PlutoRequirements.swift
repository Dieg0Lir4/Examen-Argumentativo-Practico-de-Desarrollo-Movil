//
//  PlutoRequirements.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import Foundation

import Foundation

struct PlutoRequirements {
    private let repository = CharactersRepository()
    
    func retrieveAllCharacters(page: Int, limit: Int) async throws -> [Character] {
        do {
            let characters = try await repository.getCharacters(page: page, limit: limit)
            return characters
        } catch {
            print("Error retrieving characters: \(error)")
            throw error
        }
    }
}
