//
//  DigimonDetailView.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import SwiftUI

struct DigimonDetailView: View {
    var digimon: Digimon
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                AsyncImage(url: URL(string: digimon.img)) { img in
                    img.resizable()
                        .aspectRatio(contentMode: .fit)
                    
                } placeholder: {
                    Text(digimon.name)
                }
                Text(digimon.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(digimon.level)
                    .font(.callout)
                    .fontWeight(.semibold)
                Spacer()
            }
        }
    }
}

#Preview {
    DigimonDetailView(digimon: Preview.PreviewData().digimons[0])
}
