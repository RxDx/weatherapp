//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Rodrigo Dumont on 12/09/22.
//

import UIKit

class WeatherViewController: UIViewController {

    override func loadView() {
        super.loadView()
        view = WeatherView()
    }

}
