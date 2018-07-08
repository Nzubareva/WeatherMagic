//
//  LocationCell.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 08.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    
    func reset() {
        contentLabel.text = ""
    }
}
