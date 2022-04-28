//
//  WeatherDetailViewController.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = weather?.description
    }
}
