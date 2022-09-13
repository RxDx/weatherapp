//
//  DoubleExtensions.swift
//  WeatherApp
//
//  Created by Rodrigo Dumont on 12/09/22.
//

import Foundation

extension Double {
    
    func fromKelvinToFahrenheit() -> Double {
        1.8 * (self - 273) + 32
    }
    
}
