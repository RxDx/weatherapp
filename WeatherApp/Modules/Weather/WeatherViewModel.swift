//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Rodrigo Dumont on 12/09/22.
//

import Foundation

protocol WeatherViewModelDelegate: AnyObject {
    var isLoading: Bool { get set }
    func show(weather: Weather)
    func show(error: Error)
}

class WeatherViewModel {
    
    // MARK: - Properties
    
    weak var delegate: WeatherViewModelDelegate?
    private let service: WeatherService
    
    // MARK: - Init
    
    init(service: WeatherService = WeatherServiceImpl()) {
        self.service = service
    }

    // MARK: - Methods

    func getWeather(lat: Double = 34.0194704, lon: Double = -118.491227) {
        delegate?.isLoading = true
        service.getWeather(lat: lat, lon: lon) { result in
            DispatchQueue.main.async { [weak self] in
                dump(result)
                self?.delegate?.isLoading = false
                switch result {
                case .success(let weather):
                    self?.delegate?.show(weather: weather)
                case .failure(let error):
                    self?.delegate?.show(error: error)
                }
            }
        }
    }

}
