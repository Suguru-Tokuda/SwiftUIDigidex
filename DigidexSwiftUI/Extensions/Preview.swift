//
//  Preview.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import Foundation
import SwiftUI

extension Preview {
    struct PreviewData {
        var digimons: [Digimon] = [
            Digimon(name: "Koromon", img: "https://digimon.shadowsmith.com/img/koromon.jpg", level: "In Training"),
            Digimon(name: "Tsunomon", img: "https://digimon.shadowsmith.com/img/tsunomon.jpg", level: "In Training"),
            Digimon(name: "Yokomon", img: "https://digimon.shadowsmith.com/img/yokomon.jpg", level: "In Training"),
            Digimon(name: "Motimon", img: "https://digimon.shadowsmith.com/img/motimon.jpg", level: "In Training")
        ]
    }
}
