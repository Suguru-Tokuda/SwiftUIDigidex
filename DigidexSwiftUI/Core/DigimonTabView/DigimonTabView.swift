//
//  DigimonTabView.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import SwiftUI

struct DigimonTabView: View, Hashable {
    var body: some View {
        TabView {
            DigimonListView()
                .tabItem {
                    Label(
                        title: { Text("List") },
                        icon: { Image(systemName: "rectangle.grid.1x2") }
                    )
                }
            DigimonGridView(axes: .vertical)
                .tabItem {
                    Label(
                        title: { Text("Vertical Grid") },
                        icon: { Image(systemName: "square.grid.3x3") }
                    )
                }
            DigimonGridView(axes: .horizontal)
                .tabItem {
                    Label(
                        title: { Text("Vertical Grid") },
                        icon: { Image(systemName: "circle.grid.2x1") }
                    )
                }
            FromSwiftUIToUIKit()
                .tabItem {
                    Label(
                        title: { Text("UIKit") },
                        icon: { Image(systemName: "swift") }
                    )
                }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor(Color.theme.background)
        }
    }
}

#Preview {
    DigimonTabView()
}
