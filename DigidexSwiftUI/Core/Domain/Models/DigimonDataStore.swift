//
//  DigimonDataStore.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 12/7/23.
//

import Foundation

class DigimonDataStore: ObservableObject {
    @Published var displayedDigimons: [Digimon] = []
}
