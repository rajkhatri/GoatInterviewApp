//
//  WeatherViewController.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel.shouldShowLocationButton {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Location", style: .plain, target: self, action: #selector(requestLocation))
        }
        else {
            requestLocation()
        }
    }
    
    @objc private func requestLocation() {
        viewModel.requestLocation { [weak self] (lat, lon) in
            self?.fetchWeather(lat: lat, lon: lon)
            self?.navigationItem.rightBarButtonItem = nil
        }
    }
    
    private func fetchWeather(lat: String, lon: String) {
        Task {
            do {
                try await viewModel.fetchWeatherData(lat: lat, lon: lon)
                tableView.reloadData()
            } catch {
                showAlert(error: error)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension WeatherViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return WeatherType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = WeatherType.allCases[section]
        return viewModel.getNumberOfDataPoints(type: type)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.identifier) as? WeatherCell else {
            return .init()
        }
        
        switch WeatherType.allCases[indexPath.section] {
        case .current:
            cell.setup(current: viewModel.weatherData?.current)
        case .daily:
            cell.setup(dailyForecast: viewModel.weatherData?.daily[indexPath.row])
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension WeatherViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard WeatherType.allCases[indexPath.section] == .daily else { return }
        guard let weatherDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherDetailViewController") as? WeatherDetailViewController else { return }
        weatherDetailVC.weather = viewModel.weatherData?.daily[indexPath.row].weather.first
        navigationController?.pushViewController(weatherDetailVC, animated: true)
    }
}
