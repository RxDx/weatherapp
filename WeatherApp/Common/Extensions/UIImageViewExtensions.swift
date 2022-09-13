//
//  UIImageViewExtensions.swift
//  WeatherApp
//
//  Created by Rodrigo Dumont on 12/09/22.
//

import UIKit

extension UIImageView {

    func loadFrom(url: String) {
        guard let url = URL(string: url) else {
            image = UIImage()
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            DispatchQueue.main.async {
                guard let data = data else {
                    self?.image = UIImage()
                    return
                }
                self?.image = UIImage(data: data)
            }
        }.resume()
    }

}
