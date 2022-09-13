//
//  UIViewExtensions.swift
//  WeatherApp
//
//  Created by Rodrigo Dumont on 12/09/22.
//

import UIKit

extension UIView {

    @objc func showLoading() {
        let loadingView = UIActivityIndicatorView(style: .whiteLarge)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.color = Colors.fontPrimary
        loadingView.tag = 420
        loadingView.startAnimating()
        addSubview(loadingView)
        NSLayoutConstraint.activate([
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    @objc func hideLoading() {
        viewWithTag(420)?.removeFromSuperview()
    }

}
