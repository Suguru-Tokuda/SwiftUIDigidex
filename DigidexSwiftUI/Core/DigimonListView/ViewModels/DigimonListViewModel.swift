//
//  DigimonListViewModel.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import Foundation
import Combine

class DigimonListViewModel : ObservableObject {
    @Published var digimons: [Digimon] = []
    
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
                    self.digimons = value
            }.store(in: &cancellables)
        }
    }
}
