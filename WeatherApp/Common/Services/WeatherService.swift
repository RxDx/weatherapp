//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Rodrigo Dumont on 12/09/22.
//

import Foundation

protocol WeatherService {
    func getWeather(lat: Double, lon: Double, then: @escaping (Result<Weather, Error>) -> ())
}

class WeatherServiceImpl: NetworkService, WeatherService {
    
    private let appId = "d4277b87ee5c71a468ec0c3dc311a724"
    private let baseURL = "https://api.openweathermap.org/data/2.5/"

    func getWeather(lat: Double, lon: Double, then: @escaping (Result<Weather, Error>) -> ()) {
        get(url: "\(baseURL)/weather?lat=\(lat)&lon=\(lon)&appid=\(appId)", then: then)
    }

}
