//
//  DisplayDigimonsInteractor.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 12/7/23.
//

import Foundation

protocol DisplayDigimonBusinessLogic {
    func loadDigimons(request: DisplayDigimon.LoadDigimon.Request, networkManager: NetworkableProtocol)
}

class DisplayDigimonsInteractor {
    var presenter: DisplayDigimonPresentationLogic?
}

extension DisplayDigimonsInteractor: DisplayDigimonBusinessLogic {
    func loadDigimons(
        request: DisplayDigimon.LoadDigimon.Request,
        networkManager: NetworkableProtocol
    ) {
        networkManager.makeGetRequestWithCompletion(url: URL(string: "\(Constants.apiBaseUrl)digimon")!, type: [Digimon].self) { [weak self] res in
            switch res {
            case .success(let digimons):
                let response = DisplayDigimon.LoadDigimon.Response(digimonData: digimons)
                self?.presenter?.presentDigimons(response: response)
            case .failure(_):
                break
            }
        }
    }
}
