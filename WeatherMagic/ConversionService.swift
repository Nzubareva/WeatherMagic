//
//  ConversionService.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 08.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import Foundation

class ConversionService {
    public static var shared: ConversionService!
    
    private init () {
        
    }
    
    public static func instantiateSharedInstance() {
        if shared == nil {
            shared = ConversionService()
        }
    }
    
    // MARK: Service methods
    func weatherConditionSymbol(_ weatherCode: Int) -> String {
        switch weatherCode {
        case let x where (x >= 200 && x <= 202) || (x >= 230 && x <= 232):
            return "⛈"
        case let x where x >= 210 && x <= 211:
            return "🌩"
        case let x where x >= 212 && x <= 221:
            return "⚡️"
        case let x where x >= 300 && x <= 321:
            return "🌦"
        case let x where x >= 500 && x <= 531:
            return "🌧"
        case let x where x >= 600 && x <= 602:
            return "☃️"
        case let x where x >= 603 && x <= 622:
            return "🌨"
        case let x where x >= 701 && x <= 771:
            return "🌫"
        case let x where x == 781 || x == 900:
            return "🌪"
        case let x where x == 800:
            return "☀️"
        case let x where x == 801:
            return "🌤"
        case let x where x == 802:
            return "⛅️"
        case let x where x == 803:
            return "🌥"
        case let x where x == 804:
            return "☁️"
        default:
            return "❓"
        }
    }
    
    func temperatureDisplay(_ weather: WeatherDTO) -> String {
        let kelvins = weather.atmosphericInformation.temperatureKelvin
        guard let units = Temperature(rawValue: UserDefaults.standard.integer(forKey: kTemperature)) else {
            return "\(kelvins) K"
        }
        switch units {
        case .celsius:
            return "\(String(format:"%.0f", kelvins - 273.15))°C"
        case .farenheight:
            return "\(String(format:"%.0f", kelvins * (9/5) - 459.67))°F"
        }
    }
    
    func pressureDisplay(_ weather: WeatherDTO) -> String {
        let mBar = weather.atmosphericInformation.pressurePsi
        let units = Pressure(rawValue: UserDefaults.standard.integer(forKey: kPressure)) ?? .mbar
        switch units {
        case .mm:
            return "\(String(format: "%.0f", mBar / 1.33322387415)) mm"
        case .mbar:
            return "\(String(format: "%.0f", mBar)) mBar"
        case .inches:
            return "\(String(format: "%.0f", mBar * 0.02953)) inches"
        }
    }
    
    func windSpeedDisplay(_ weather: WeatherDTO) -> String {
        let ms = weather.windInformation.windspeed
        let units = WindSpeed(rawValue: UserDefaults.standard.integer(forKey: kWindSpeed)) ?? .meterpersecond
        switch units {
        case .kmperhour:
            return "\(String(format: "%.0f", ms * 3.6)) km/h"
        case .mlperhour:
            return "\(String(format: "%.0f", ms * 2.23694)) miles/h"
        case .meterpersecond:
            return "\(String(format: "%.0f", ms)) m/s"
        }
    }
}
