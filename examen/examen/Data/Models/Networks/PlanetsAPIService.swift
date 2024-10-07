import Foundation

struct PlanetsAPIService {
    private let baseURL = "https://dragonball-api.com/api/planets"
    
    func fetchCharactersForPlanet(id: Int) async throws -> [Character] {
        guard let url = URL(string: "\(baseURL)/\(id)") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let planet = try JSONDecoder().decode(Planet.self, from: data)
        return planet.characters
    }
}
