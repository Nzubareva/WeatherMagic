//
//  WeatherLocationService.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 08.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import Foundation

class WeatherLocationService {
    public static var shared: WeatherLocationService!
    
    private var currentLocation: LocationDTO?
    
    private init() {
        
    }
    
    public static func instantiateSharedInstance() {
        if shared == nil {
            shared = WeatherLocationService()
        }
    }
    
    // MARK: Service methods
    func storedLocations() -> [LocationDTO] {
        let minsk = LocationDTO(identifier: 625144, name: "Minsk", country: "BY", coordinates: Coordinates(latitude: 53.9, longitude: 27.56))
        return [minsk]
    }
    
    func getCurrentLocation() -> LocationDTO {
        return currentLocation ?? LocationDTO(identifier: 625144, name: "Minsk", country: "BY", coordinates: Coordinates(latitude: 53.9, longitude: 27.56))
    }
    
}
