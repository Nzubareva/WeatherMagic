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
    
    // hardcoded Minsk id in case no defaults set
    private static let defaultCityId = 625144
    
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
        let london = LocationDTO(identifier: 2643743, name: "London", country: "GB", coordinates: Coordinates(latitude: 51.51, longitude: -0.13))
        let warsaw = LocationDTO(identifier: 756135, name: "Warsaw", country: "PL", coordinates: Coordinates(latitude: 52.23, longitude: 21.01))
        let kerkyra = LocationDTO(identifier: 2463679, name: "Kerkyra", country: "GR", coordinates: Coordinates(latitude: 39.62, longitude: 19.92))
        let phoenix = LocationDTO(identifier: 5308655, name: "Phoenix", country: "US", coordinates: Coordinates(latitude: 33.45, longitude: -112.08))
        let stockholm = LocationDTO(identifier: 2673730, name: "Stockholm", country: "SE", coordinates: Coordinates(latitude: 59.33, longitude: 18.07))
        return [minsk, london, warsaw, kerkyra, phoenix, stockholm]
    }
    
    func getCurrentLocation() -> LocationDTO {
        var currentLocation: LocationDTO?
        let cityId = UserDefaults.standard.integer(forKey: kCity) == 0 ? WeatherLocationService.defaultCityId : UserDefaults.standard.integer(forKey: kCity)
        currentLocation = storedLocations().filter({$0.identifier == cityId}).first
        return currentLocation ?? LocationDTO(identifier: 625144, name: "Minsk", country: "BY", coordinates: Coordinates(latitude: 53.9, longitude: 27.56))
    }
    
    func updateCurrentLocation(_ location: LocationDTO) {
        UserDefaults.standard.set(location.identifier, forKey: kCity)
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
