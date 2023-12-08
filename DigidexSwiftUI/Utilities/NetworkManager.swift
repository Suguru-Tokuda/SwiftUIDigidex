//
//  NetworkManager.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import Foundation

protocol NetworkableProtocol {
    func makeGetRequest<T: Decodable>(url: URL, type: T.Type) async throws -> T?
    func makeGetRequestWithCompletion<T: Decodable>(url: URL, type: T.Type, completionHandler: @escaping(Result<T, Error>) -> Void)
}

class NetworkManager : NetworkableProtocol {
    static let shared = NetworkManager()
    
    init() {}
    
    func makeGetRequest<T: Decodable>(url: URL, type: T.Type) async throws -> T? {
        do {
            let request = URLRequest(url: url)
            let (rawData, response) =  try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else { return nil }
            
            let data = try JSONDecoder().decode(type, from: rawData)
            
            return data
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func makeGetRequestWithCompletion<T>(url: URL, type: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                completionHandler(.failure(CustomNetworkError.badUrlResponse(url: url)))
                return
            }
            
            if let data {
                do {
                    let parsedData = try JSONDecoder().decode(type, from: data)
                    completionHandler(.success(parsedData))
                } catch {
                    completionHandler(.failure(CustomNetworkError.unknown))
                }
            } else {
                completionHandler(.failure(CustomNetworkError.badUrlResponse(url: url)))
            }
        }
        .resume()
    }
}
