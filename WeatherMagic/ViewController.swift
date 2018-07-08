//
//  ViewController.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 17.06.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DayTime: UILabel!
    
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var sunset: UILabel!
    @IBOutlet weak var cloudCover: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var windDirection: UILabel!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var locationsButton: UIBarButtonItem!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var conditionDescriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    lazy var dateFormatter: DateFormatter = {
        let formatter =  DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DayTime.text = "время"
        self.sunrise.text = " восход"
        self.sunset.text = "заход"
        self.cloudCover.text = "облачность"
        self.humidity.text = "влажность "
        self.pressure.text = "давление"
        self.windSpeed.text = "скорость ветра"
        self.windDirection.text = "направление ветра"
        
        // Do any additional setup after loading the view, typically from a nib.
        reloadUI()
    }
    
    func reloadUI() {
        WeatherLocationService.shared.getWeather() { weather in
            self.updateUIwithWeather(weather)
        }
    }
    
    private func updateUIwithWeather(_ weatherDTO: WeatherDTO?) {
        guard let weather = weatherDTO else {
            return
        }
        weatherConditionLabel.text = ConversionService.shared.weatherConditionSymbol(weather.weatherCondition[0].identifier)
        conditionLabel.text = weather.weatherCondition[0].conditionName
        conditionDescriptionLabel.text = weather.weatherCondition[0].conditionDescription
        temperatureLabel.text = String(weather.atmosphericInformation.temperatureKelvin)
        self.DayTime.text = dateFormatter.string(from: Date(timeIntervalSince1970: weather.time))
        self.sunrise.text = dateFormatter.string(from: Date(timeIntervalSince1970: weather.sysInformation.sunrise))
        self.sunset.text = dateFormatter.string(from: Date(timeIntervalSince1970: weather.sysInformation.sunset))
        self.cloudCover.text = "\(Int(weather.cloudCoverage.coverage))%"
        self.humidity.text = "\(Int(weather.atmosphericInformation.humidity))%"
        self.pressure.text = "\(weather.atmosphericInformation.pressurePsi)"
        self.windSpeed.text = "\(weather.windInformation.windspeed)"
        self.windDirection.text = "\(weather.windInformation.degrees)º"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSettingsButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SettingsTVC") as! SettingsTableViewController
        let destinationNavigationController = UINavigationController(rootViewController: destinationViewController)
        destinationNavigationController.addDoneButton()
        navigationController?.present(destinationNavigationController, animated: true, completion: nil)
    }
    
    @IBAction func didTapLocationsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Locations", bundle: nil)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "LocationsTVC") as! LocationsTableViewController
        let destinationNavigationController = UINavigationController(rootViewController: destinationViewController)
        navigationController?.present(destinationNavigationController, animated: true, completion: nil)
    }
    
}

