//
//  WeatherDTO.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 08.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherDTO {
    var coordinates: Coordinates
    var weatherCondition: [WeatherCondition]
    var atmosphericInformation: AtmosphericInformation
    var windInformation: WindInformation
    var cloudCoverage: CloudCoverage
    var rainForecast: RainForecast
    var snowForecast: SnowForecast
    var time: Double
    var sysInformation: SysInfo
    var cityID: Int
    var cityName: String

    init(_ json: JSON) {
        coordinates = Coordinates(json["coord"])
        weatherCondition = [WeatherCondition]()
        for weather in json["weather"].arrayValue {
            weatherCondition.append(WeatherCondition(weather))
        }
        atmosphericInformation = AtmosphericInformation(json["main"])
        windInformation = WindInformation(json["wind"])
        cloudCoverage = CloudCoverage(json["clouds"])
        rainForecast = RainForecast(json["rain"])
        snowForecast = SnowForecast(json["snow"])
        time = json["dt"].doubleValue
        sysInformation = SysInfo(json["sys"])
        cityID = json["id"].intValue
        cityName = json["name"].stringValue
    }
}
