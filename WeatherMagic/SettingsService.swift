//
//  SettingsService.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 08.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import Foundation
import UIKit

class SettingsService {
    public static var shared: SettingsService!
    
    private init () {
        
    }
    
    public static func instantiateSharedInstance() {
        if shared == nil {
            shared = SettingsService()
        }
    }
    
    // MARK: service methods
    @objc func didTempretureUnitsChanged(_ sender: UISegmentedControl) {
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: kTemperature)
    }
    @objc func didWindSpeedUnitsChanged(_ sender: UISegmentedControl) {
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: kWindSpeed)
    }
    @objc func didPressureUnitsChanged(_ sender: UISegmentedControl) {
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: kPressure)
    }
    @objc func didVisibilityUnitsChanged(_ sender: UISegmentedControl) {
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: kVisibility)
    }
}

enum Temperature: Int {
    case celsius, farenheight
}
enum WindSpeed: Int {
    case kmperhour, mlperhour, meterpersecond
}
enum Pressure: Int {
    case mm, mbar, inches
}
enum Visibility: Int {
    case kilometers, miles
}
