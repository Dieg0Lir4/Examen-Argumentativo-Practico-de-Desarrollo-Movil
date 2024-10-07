//
//  Planets.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

struct Planet: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let description: String?
    let isDestroyed: Bool
    let characters: [Character] // Array de personajes en el planeta
}


