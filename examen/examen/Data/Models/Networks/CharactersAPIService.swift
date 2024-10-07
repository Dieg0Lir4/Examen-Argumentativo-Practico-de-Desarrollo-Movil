//
//  CharactersAPIService.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import Foundation

struct CharactersAPIService {
    private let baseURL = "https://dragonball-api.com/api/characters"
    
    func fetchCharacters(page: Int, limit: Int) async throws -> [Character] {
        // Construcción de la URL con parámetros de paginación
        guard let url = URL(string: "\(baseURL)?page=\(page)&limit=\(limit)") else {
            throw URLError(.badURL)
        }
        
        // Hacer la solicitud a la API
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decodificar la respuesta
        let response = try JSONDecoder().decode(CharactersResponse.self, from: data)
        return response.items
    }
}


