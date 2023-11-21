//
//  MainViewModel.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import SwiftUI

enum HomeRoute : String, Hashable {
    case signIn, tabs
}

class MainViewModel : ObservableObject {
    @Published var homeRoute: HomeRoute = .signIn
}
