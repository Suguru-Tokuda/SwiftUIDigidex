//
//  DigimonGridViewCell.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import SwiftUI

struct DigimonGridViewCell: View {
    var digimon: Digimon
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: digimon.img)) { img in
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
            } placeholder: {
                Text(digimon.name)
                    .foregroundStyle(Color.theme.text)
            }
            Text(digimon.name)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color.theme.text)
        }
        .frame(width: 100, height: 150)
    }
}

#Preview {
    DigimonGridViewCell(digimon: Preview.PreviewData().digimons[0])
}
