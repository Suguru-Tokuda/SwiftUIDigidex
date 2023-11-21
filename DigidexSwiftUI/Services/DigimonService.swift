//
//  DigimonService.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import Foundation

class DigimonService {
    static let shared = DigimonService()
    
    @Published var digimons: [Digimon] = []
    
    init() {
        Task {
            try await getDigimons()
        }
    }
    
    func getDigimons() async throws -> Void {
        let urlStr = "\(Constants.apiBaseUrl)digimon"
        
        if let url = URL(string: urlStr) {
            let digimons = try await NetworkManager.shared.makeGetRequest(url: url, type: [Digimon].self)
            if let digimons {
                self.digimons = digimons
            }
        } else {
            throw CustomNetworkError.invalidURL(url: urlStr)
        }
    }
}
