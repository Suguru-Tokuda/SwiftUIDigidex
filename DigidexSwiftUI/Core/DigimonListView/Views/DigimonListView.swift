//
//  DigimonListView.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import SwiftUI

struct DigimonListView: View {
    @StateObject var vm = DigimonListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                List {
                    ForEach(vm.digimons, id: \.self) { digimon in
                        DigimonListViewCell(digimon: digimon)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0.5, trailing: 0))
                            .background(Color.theme.background)
                            .background(NavigationLink("", destination: {
                                DigimonDetailView(digimon: digimon)
                            }))
                    }
                }
                .padding(.horizontal, 5)
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(Color.theme.background)
            }
        }
    }
}

#Preview {
    DigimonListView(vm: DigimonListViewModel(digimons: Preview.PreviewData().digimons))
}
