//
//  PlanetButton.swift
//  examen
//
//  Created by Diego Lira on 07/10/24.
//

import SwiftUI


struct PlanetButton<Destination: View>: View {
    var planetName: String
    var imageName: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                Text(planetName)
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
