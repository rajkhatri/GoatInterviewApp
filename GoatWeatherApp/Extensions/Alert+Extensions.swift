//
//  Alert+Extensions.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import UIKit

extension UIViewController {
    
    func showAlert(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
