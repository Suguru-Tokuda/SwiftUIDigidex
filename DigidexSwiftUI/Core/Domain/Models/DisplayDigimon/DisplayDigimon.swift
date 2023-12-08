//
//  DisplayDigimon.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 12/7/23.
//

import Foundation

enum DisplayDigimon {
    enum LoadDigimon {
        struct Request{}
        
        struct Response {
            var digimonData: [Digimon]
        }
        
        struct ViewModel {
            var digimons: [Digimon]
        }
    }
}
