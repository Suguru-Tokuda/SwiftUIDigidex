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
    var view: DisplayDigimonBusinessLogic?
}
