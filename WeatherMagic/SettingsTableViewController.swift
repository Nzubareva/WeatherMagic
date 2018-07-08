//
//  SettingsTableViewController.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 07.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import Foundation
import UIKit

class SettingsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
     //   navigationItem.backBarButtonItem 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentedControlCell", for: indexPath) as! SegmentedControlCell
                cell.reset()
                cell.contentLabel.text = "Temperature"
                cell.segmentedControl.insertSegment(withTitle: "ºC", at: 0, animated: true)
                cell.segmentedControl.insertSegment(withTitle: "ºF", at: 1, animated: true)
                return cell
            }
            if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentedControlCell", for: indexPath) as! SegmentedControlCell
                cell.reset()
                cell.contentLabel.text = "Wind speed"
                cell.segmentedControl.insertSegment(withTitle: "km/h", at: 0, animated: true)
                cell.segmentedControl.insertSegment(withTitle: "mph", at: 1, animated: true)
                cell.segmentedControl.insertSegment(withTitle: "m/s", at: 2, animated: true)
                return cell
            }
            if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentedControlCell", for: indexPath) as! SegmentedControlCell
                cell.reset()
                cell.contentLabel.text = "Pressure"
                cell.segmentedControl.insertSegment(withTitle: "mm", at: 0, animated: true)
                cell.segmentedControl.insertSegment(withTitle: "mbar", at: 1, animated: true)
                cell.segmentedControl.insertSegment(withTitle: "inches", at: 2, animated: true)
                return cell
            }
            if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentedControlCell", for: indexPath) as! SegmentedControlCell
                cell.reset()
                cell.contentLabel.text = "Precipitation"
                cell.segmentedControl.insertSegment(withTitle: "mm", at: 0, animated: true)
                cell.segmentedControl.insertSegment(withTitle: "inches", at: 1, animated: true)
                return cell
            }
            if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentedControlCell", for: indexPath) as! SegmentedControlCell
                cell.reset()
                cell.contentLabel.text = "Visibility"
                cell.segmentedControl.insertSegment(withTitle: "km", at: 0, animated: true)
                cell.segmentedControl.insertSegment(withTitle: "miles", at: 1, animated: true)
                return cell
            }
            else {
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
