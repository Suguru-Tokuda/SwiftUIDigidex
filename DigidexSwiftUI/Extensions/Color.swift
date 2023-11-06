//
//  Color.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
    
    struct ColorTheme {
        let background = Color("Background")
        let secondaryBackground = Color("SecondaryBackground")
        let text = Color("Text")
    }
}
