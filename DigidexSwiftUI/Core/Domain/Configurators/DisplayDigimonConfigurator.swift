//
//  DisplayDigimonConfigurator.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 12/7/23.
//

import SwiftUI

extension DigimonListView {
    func configureView() -> some View {
        var view = self
        let interactor = DisplayDigimonsInteractor()
        let presenter = DisplayDigimonsPresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}
