//
//  WeatherLocationService.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 08.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocationService {
    public static var shared: WeatherLocationService!
    private static let apiUrl = "https://api.openweathermap.org/data/2.5/weather"
    private static let idParam = "id"
    private static let appIdParam = "APPID"
    
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
    
    func updateCurrentLocation() {
        // TODO:
    }
    
    func getWeather(completion: @escaping (WeatherDTO?) -> Void) {
        let location = getCurrentLocation()
        let url = "\(WeatherLocationService.apiUrl)?\(WeatherLocationService.appIdParam)=\(SettingsService.shared.getApiKey())&\(WeatherLocationService.idParam)=\(location.identifier)"
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(WeatherDTO(json))
            case .failure(let error):
                completion(nil)
                print(error)
            }
        }
    }
    
}
