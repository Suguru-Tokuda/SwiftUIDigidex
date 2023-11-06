//
//  Digimon.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import Foundation

struct Digimon : Codable, Identifiable, Hashable {
    var id = UUID()
    var name: String
    var img: String
    var level: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, img, level
    }
}

struct DigimonSimple : Decodable {
    var name: String
    var img: String
    var level: String
}
