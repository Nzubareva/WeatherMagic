//
//  SegmentedControlCell.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 07.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//

import UIKit

class SegmentedControlCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    

    func reset() {
        segmentedControl.removeAllSegments()
        contentLabel.text = ""
    }
}
