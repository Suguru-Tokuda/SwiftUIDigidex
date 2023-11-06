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
//            let digimons = try await NetworkManager.shared.makeGetRequest(url: url, type: [Digimon].self)
            let digimons = try await makeGetRequest(url: url)
            if let digimons {
                self.digimons = digimons.map { Digimon(id: UUID(), name: $0.name, img: $0.img, level: $0.level)}
            }
        } else {
            throw CustomNetworkError.invalidURL(url: urlStr)
        }
    }
    
    func makeGetRequest(url: URL) async throws -> [DigimonSimple]? {
        do {
            let request = URLRequest(url: url)
            let (rawData, response) =  try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else { return nil }
            
            let data = try JSONDecoder().decode([DigimonSimple].self, from: rawData)
            
            return data
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }

}
