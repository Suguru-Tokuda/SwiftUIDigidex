//
//  DisplayDigimonPresenter.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 12/7/23.
//

import Foundation

protocol DisplayDigimonPresentationLogic {
    func presentDigimons(response: DisplayDigimon.LoadDigimon.Response)
}

class DisplayDigimonsPresenter {
    var view: DisplayDigimonDisplayLogic?
}

extension DisplayDigimonsPresenter: DisplayDigimonPresentationLogic {
    func presentDigimons(response: DisplayDigimon.LoadDigimon.Response) {
        let vm = DisplayDigimon.LoadDigimon.ViewModel(digimons: response.digimonData)
        
        view?.displayDigimons(viewModel: vm)
    }
}
