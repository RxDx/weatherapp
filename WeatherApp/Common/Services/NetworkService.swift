//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Rodrigo Dumont on 12/09/22.
//

import Foundation

class NetworkService {
    
    enum NetworkServiceError: Error {
        case invalidUrl
        case noData
    }

    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func get<T: Codable>(url: String, then: @escaping (Result<T, Error>) -> ()) {
        guard let url = URL(string: url) else {
            then(.failure(NetworkServiceError.invalidUrl))
            return
        }
        let urlRequest = URLRequest(url: url)
        urlSession.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let error = error {
                then(.failure(error))
                return
            }
            guard let data = data else {
                then(.failure(NetworkServiceError.noData))
                return
            }
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                then(.success(object))
            } catch {
                then(.failure(error))
            }
        }.resume()
    }
}
