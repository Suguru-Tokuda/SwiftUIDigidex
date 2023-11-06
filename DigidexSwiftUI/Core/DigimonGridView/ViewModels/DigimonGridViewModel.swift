//
//  DigimonGridViewModel.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import Foundation
import Combine

class DigimonGridViewModel : ObservableObject {
    @Published var digimons: [Digimon] = []
    @Published var digimonDict: [String : [Digimon]] = [:]
    @Published var sections: [String] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        addSubscriptions()
    }
    
    init(digimons: [Digimon]) {
        self.digimons = digimons
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    private func addSubscriptions() {
        Task {
            DigimonService
                .shared
                .$digimons
                .receive(on: DispatchQueue.main)
                .sink { value in
                    self.processDigimons(digimons: value)
            }.store(in: &cancellables)
        }
    }
    
    private func processDigimons(digimons: [Digimon]) {
        self.digimons = digimons
        var levels: [String] = Array(Set(digimons.map { $0.level }))
        
        levels.forEach { level in
            var filtered = digimons.filter { $0.level == level }
            filtered = filtered.sorted(by: { $0.name < $1.name })
            digimonDict[level] = filtered
        }
        
        self.sections = Array(self.digimonDict.keys)
    }
}
