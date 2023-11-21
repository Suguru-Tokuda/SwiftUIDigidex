//
//  DigimonListViewCell.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import SwiftUI

struct DigimonListViewCell: View {
    var digimon: Digimon
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: digimon.img)) { img in
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
            } placeholder: {
                ZStack {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(3)
                        .controlSize(.mini)
                }
                .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading) {
                Text(digimon.name)
                    .font(.headline)
                Text(digimon.level)
                    .font(.caption)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
    }
}

#Preview {
    DigimonListViewCell(digimon: Preview.PreviewData().digimons[0])
}
