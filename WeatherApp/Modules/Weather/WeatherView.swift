//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Rodrigo Dumont on 12/09/22.
//

import UIKit

class WeatherView: UIView {
    
    // MARK: - Properties
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Colors.fontPrimary
        view.text = "Santa Monica"
        return view
    }()
    
    private lazy var weatherImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Colors.fontPrimary
        view.font = UIFont.systemFont(ofSize: 44, weight: .semibold)
        view.text = "71°"
        return view
    }()
    
    private lazy var conditionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Colors.fontPrimary
        view.text = "Light rain"
        return view
    }()
    
    private lazy var lowLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Colors.fontPrimary
        view.text = "Low: 58°"
        return view
    }()
    
    private lazy var highLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Colors.fontPrimary
        view.text = "High: 72°"
        return view
    }()
    
    private lazy var windLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.fontPrimary
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Wind: 8.5 (135)"
        return view
    }()
    
    private lazy var lowHightContainerView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            lowLabel,
            highLabel
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.spacing = 16
        return view
    }()
    
    private lazy var containerView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            titleLabel,
            weatherImage,
            temperatureLabel,
            conditionLabel,
            lowHightContainerView,
            windLabel
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 20
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Methods
    
    private func setupView() {
        backgroundColor = Colors.background
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
