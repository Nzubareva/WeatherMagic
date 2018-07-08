//
//  CommonDTOs.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 08.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
    
    init(_ json: JSON) {
        latitude = json["lat"].doubleValue
        longitude = json["lon"].doubleValue
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

struct WeatherCondition: Codable {
    var identifier: Int
    var conditionName: String
    var conditionDescription: String
    var conditionIconCode: String
    
    init(_ json: JSON) {
        identifier = json["id"].intValue
        conditionName = json["main"].stringValue
        conditionDescription = json["description"].stringValue
        conditionIconCode = json["icon"].stringValue
    }
}

struct AtmosphericInformation: Codable {
    var temperatureKelvin: Double
    var pressurePsi: Double
    var humidity: Double
    var minTemperature: Double
    var maxTemperature: Double
    
    init(_ json: JSON) {
        temperatureKelvin = json["temp"].doubleValue
        pressurePsi = json["pressure"].doubleValue
        humidity = json["humidity"].doubleValue
        minTemperature = json["temp_min"].doubleValue
        maxTemperature = json["temp_max"].doubleValue
    }
}

struct WindInformation: Codable {
    var windspeed: Double
    var degrees: Double
    
    init(_ json: JSON) {
        windspeed = json["speed"].doubleValue
        degrees = json["deg"].doubleValue
    }
}

struct CloudCoverage: Codable {
    var coverage: Double
    
    init(_ json: JSON) {
        coverage = json["all"].doubleValue
    }
}

struct RainForecast: Codable {
    var volume: Double
    
    init(_ json: JSON) {
        volume = json["3h"].doubleValue
    }
}

struct SnowForecast: Codable {
    var volume: Double

    init(_ json: JSON) {
        volume = json["3h"].doubleValue
    }
}

struct SysInfo: Codable {
    var country: String
    var sunrise: Double
    var sunset: Double

    init(_ json: JSON) {
        country = json["country"].stringValue
        sunrise = json["sunrise"].doubleValue
        sunset = json["sunset"].doubleValue
    }
}
