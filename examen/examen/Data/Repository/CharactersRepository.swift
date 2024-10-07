//
//  CharactersRepository.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import Foundation

struct CharactersRepository {
    private let apiService = CharactersAPIService()
    
    func getCharacters(page: Int, limit: Int) async throws -> [Character] {
        do {
            let characters = try await apiService.fetchCharacters(page: page, limit: limit)
            return characters
        } catch {
            print("Error fetching characters: \(error)")
            throw error
        }
    }
}
