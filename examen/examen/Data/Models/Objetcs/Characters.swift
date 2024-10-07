//
//  Characters.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import Foundation

// Estructura para cada personaje
struct Character: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let ki: String
    let maxKi: String
    let race: String
    let gender: String
    let description: String
    let image: String
    let affiliation: String
    let deletedAt: String? // Esto puede ser opcional si puede ser null
}
