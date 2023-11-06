//
//  DigimonGridView.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import SwiftUI

struct DigimonGridView: View {
    var axes: Axis.Set = .vertical
    let columns = Array(repeating: GridItem(), count: 3)
    let rows = Array(repeating: GridItem(), count: 1)
    
    @StateObject var vm = DigimonGridViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                ZStack {
                    if axes == .vertical {
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(vm.digimons, id: \.self) { digimon in
                                    NavigationLink {
                                        DigimonDetailView(digimon: digimon)
                                    } label: {
                                        DigimonGridViewCell(digimon: digimon)
                                    }
                                }
                            }
                        }
                    } else {
                        ScrollView(.vertical) {
                            ForEach(vm.sections, id: \.self) { el in
                                if let digimons = vm.digimonDict[el] {
                                    VStack(alignment: .leading) {
                                        Text(el)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    ScrollView(.horizontal) {
                                        LazyHGrid(rows: rows) {
                                            ForEach(digimons, id: \.self) { digimon in
                                                NavigationLink {
                                                    DigimonDetailView(digimon: digimon)
                                                } label: {
                                                    DigimonGridViewCell(digimon: digimon)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                }
                    .padding(.horizontal, 5)
            }
        }
    }
}

#Preview {
    DigimonGridView(axes: .vertical, vm: DigimonGridViewModel(digimons: Preview.PreviewData().digimons))
}
