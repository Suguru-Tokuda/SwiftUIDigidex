//
//  DigimonListView.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import SwiftUI

protocol DisplayDigimonDisplayLogic {
    func displayDigimons(viewModel: DisplayDigimon.LoadDigimon.ViewModel)
}

extension DigimonListView: DisplayDigimonDisplayLogic {
    func displayDigimons(viewModel: DisplayDigimon.LoadDigimon.ViewModel) {
        DispatchQueue.main.async {
            self.digimon.displayedDigimons = viewModel.digimons
        }
    }
    
    func fetchDigimons() {
        let request = DisplayDigimon.LoadDigimon.Request()
        interactor?.loadDigimons(request: request, networkManager: NetworkManager.shared)
    }
}

struct DigimonListView: View {
    var interactor: DisplayDigimonBusinessLogic?
//    @StateObject var vm = DigimonListViewModel()
    @ObservedObject var digimon: DigimonDataStore = DigimonDataStore()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                List {
                    ForEach(digimon.displayedDigimons, id: \.self) { digimon in
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
        .onAppear {
            fetchDigimons()
        }
    }
}

//#Preview {
//    DigimonListView(vm: DigimonListViewModel(digimons: Preview.PreviewData().digimons))
//}
