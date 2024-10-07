//
//  PlanetsView.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import SwiftUI

struct PlanetsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Título fijo en la parte superior
                    Text("Elige un Planeta para ver a sus personajes de Dragon Ball")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    // Scroll horizontal para los planetas
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            // Planeta Tierra
                            PlanetButton(
                                planetName: "Tierra",
                                imageName: "earth",
                                destination: EarthView()
                            )
                            
                            // Planeta Namek
                            PlanetButton(
                                planetName: "Namek",
                                imageName: "namek",
                                destination: NamekView()
                            )
                            
                            // Planeta Vegeta
                            PlanetButton(
                                planetName: "Planeta Vegeta",
                                imageName: "vegetaP",
                                destination: VegetaView()
                            )
                        }
                        .padding()
                    }
                    .frame(height: 300) // Ajusta la altura según sea necesario
                    
                    // Botón fijo para el planeta genérico (Pluto)
                    PlanetButton(
                        planetName: "Todos",
                        imageName: "pluto",
                        destination: PlutoView()
                    )
                    .padding(.bottom, 20)
                }
                .padding()
            }
        }
    }
}

#Preview {
    PlanetsView()
}
