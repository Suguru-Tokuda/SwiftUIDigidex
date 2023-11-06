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
                        NavigationLink {
                            DigimonDetailView(digimon: digimon)
                        } label: {
                            DigimonListViewCell(digimon: digimon)
                                .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    DigimonListView(vm: DigimonListViewModel(digimons: Preview.PreviewData().digimons))
}
