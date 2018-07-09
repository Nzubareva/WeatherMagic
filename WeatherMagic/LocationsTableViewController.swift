//
//  LocationsTableViewController.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 08.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    private var storedLocations: [LocationDTO]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        storedLocations = WeatherLocationService.shared.storedLocations()
    }
    
    //MARK: TableView delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return storedLocations?.count ?? 0
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let location = storedLocations?[indexPath.row] {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
            cell.reset()
            cell.contentLabel.text = "\(location.name), \(location.country)"
            if location.identifier == WeatherLocationService.shared.getCurrentLocation().identifier {
                cell.selectedLabel.text = "☼"
            }
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        WeatherLocationService.shared.updateCurrentLocation(WeatherLocationService.shared.storedLocations()[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
}
