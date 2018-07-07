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
    

}

