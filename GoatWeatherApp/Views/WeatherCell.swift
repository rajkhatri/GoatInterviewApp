//
//  WeatherCell.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Kingfisher
import UIKit

class WeatherCell: UITableViewCell {
    
    static let identifier = "WeatherCell"
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
        dateLabel.text = ""
        highTempLabel.text = ""
        lowTempLabel.text = ""
        lowTempLabel.isHidden = false
    }
    
    func setup(current: CurrentForecast?) {
        guard let current = current else { return }
        
        downloadImage(current.weather.first?.imageURL)
        dateLabel.text = current.dt.readable
        highTempLabel.text = "Currently: \(current.temp)ºF"
        lowTempLabel.isHidden = true
    }
    
    func setup(dailyForecast: DailyForecast?) {
        guard let dailyForecast = dailyForecast else { return }
        
        downloadImage(dailyForecast.weather.first?.imageURL)
        dateLabel.text = dailyForecast.dt.readable
        
        if let maxTemp = dailyForecast.temp.max {
            highTempLabel.text = "High: \(maxTemp)ºF"
        }
        
        if let minTemp = dailyForecast.temp.min {
            lowTempLabel.text = "Low: \(minTemp)ºF"
        }
    }
    
    private func downloadImage(_ url: URL?) {
        guard let imageURL = url else { return }
        iconView.kf.setImage(with: imageURL, options: [.transition(.fade(0.3)), .forceTransition])
    }
}
