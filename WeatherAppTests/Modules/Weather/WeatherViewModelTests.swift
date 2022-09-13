//
//  WeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by Rodrigo Dumont on 13/09/22.
//

import XCTest
@testable import WeatherApp

final class WeatherViewModelTests: XCTestCase {
    
    class WeatherServiceMock: WeatherService {
        enum WeatherServiceError: Error {
            case generic
        }
        func getWeather(lat: Double, lon: Double, then: @escaping (Result<Weather, Error>) -> ()) {
            if lat == 0 && lon == 0 {
                then(.failure(WeatherServiceError.generic))
                return
            }
            then(.success(Weather(coord: Weather.Coord(lon: 42, lat: 42), weather: [Weather.Weather(id: 42, main: "main", description: "description", icon: "icon")], base: "base", main: Weather.Main(temp: 42, feelsLike: 42, tempMin: 42, tempMax: 42, pressure: 42, humidity: 42), visibility: 42, wind: Weather.Wind(speed: 42, deg: 42), clouds: Weather.Clouds(all: 42), dt: 42, sys: Weather.Sys(type: 42, id: 42, country: "BR", sunrise: 42, sunset: 42), timezone: 42, id: 42, name: "name", cod: 42)))
        }
    }
    
    class WeatherViewModelDelegateMock: NSObject, WeatherViewModelDelegate {
        var isLoading: Bool = false
        
        var didShowWeather: ((Bool) -> Void)?
        func show(weather: WeatherApp.Weather) {
            didShowWeather?(true)
        }
        
        var didShowError: ((Bool) -> Void)?
        func show(error: Error) {
            didShowError?(true)
        }
    }
    
    var sut: WeatherViewModel?
    var sutDelegate: WeatherViewModelDelegateMock?
    
    override func setUp() {
        super.setUp()
        sut = WeatherViewModel(service: WeatherServiceMock())
        sutDelegate = WeatherViewModelDelegateMock()
        sut?.delegate = sutDelegate
    }
    
    override func tearDown() {
        sutDelegate = nil
        sut = nil
        super.tearDown()
    }
    
    func testGetWeatherWithSuccess() {
        // GIVEN
        var didShowWeather = false
        let expectation = expectation(description: "getWeather")
        sutDelegate?.didShowWeather = { result in
            didShowWeather = result
            expectation.fulfill()
        }
        
        // WHEN
        sut?.getWeather()
        
        // THEN
        waitForExpectations(timeout: 1)
        XCTAssertTrue(didShowWeather)
    }

    func testGetWeatherWithError() {
        // GIVEN
        var didShowError = false
        let expectation = expectation(description: "getWeather")
        sutDelegate?.didShowError = { result in
            didShowError = result
            expectation.fulfill()
        }
        
        // WHEN
        sut?.getWeather(lat: 0, lon: 0)
        
        // THEN
        waitForExpectations(timeout: 1)
        XCTAssertTrue(didShowError)
    }

}
