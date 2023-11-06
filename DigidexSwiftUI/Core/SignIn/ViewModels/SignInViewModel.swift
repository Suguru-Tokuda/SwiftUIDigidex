//
//  SignInViewModel.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import Foundation
import SwiftUI

class SignInViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func logInBtnTapped() {
    }
    
    private func isValidCredenttials(email: String, password: String) -> Bool {
        
        return false
    }
}
