//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Rodrigo Dumont on 12/09/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let viewModel = WeatherViewModel()
    var isLoading: Bool = false {
        didSet {
            updateLoading()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override func loadView() {
        super.loadView()
        view = WeatherView()
        viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getWeather()
    }
    
    private func updateLoading() {
        isLoading ? showLoading() : hideLoading()
    }

}

extension WeatherViewController: WeatherViewModelDelegate {

    func show(weather: Weather) {
        (view as? WeatherView)?.show(weather: weather)
    }

    func show(error: Error) {
        (view as? WeatherView)?.showError(message: error.localizedDescription)
    }

}
