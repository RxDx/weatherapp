//
//  Weather.swift
//  WeatherApp
//
//  Created by Rodrigo Dumont on 12/09/22.
//

import Foundation

struct Weather: Codable {

    struct Coord: Codable {
        let lon: Double
        let lat: Double
    }

    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
        var iconUrl: String {
            "https://openweathermap.org/img/wn/\(icon)@2x.png"
        }
    }

    struct Main: Codable {
        let temp: Double
        let feelsLike: Double
        let tempMin: Double
        let tempMax: Double
        let pressure: Double
        let humidity: Double
        
        private enum CodingKeys : String, CodingKey {
            case temp, pressure, humidity
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
    }

    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }

    struct Clouds: Codable {
        let all: Int
    }

    struct Sys: Codable {
        let type: Int
        let id: Int
        let country: String
        let sunrise: Int
        let sunset: Int
    }

    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}
