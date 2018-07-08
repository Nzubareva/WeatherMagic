//
//  LocationDTO.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 08.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import Foundation

struct LocationDTO {
    var identifier: Int
    var name: String
    var country: String
    var coordinates: Coordinates
    
    init(identifier: Int, name: String, country: String, coordinates: Coordinates) {
        self.identifier = identifier
        self.name = name
        self.country = country
        self.coordinates = coordinates
    }
}

struct Coordinates {
    var latitude: Double
    var longitude: Double
}
