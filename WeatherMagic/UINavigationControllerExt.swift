//
//  UINavigationControllerExt.swift
//  WeatherMagic
//
//  Created by Natallia Zubareva on 07.07.2018.
//  Copyright © 2018 Natallia Zubareva. All rights reserved.
//
import UIKit

extension UINavigationController {
    func addDoneButton() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(UINavigationController.didCloseButtonPress(_:)))
        self.viewControllers.first?.navigationItem.rightBarButtonItem = doneButton
    }

    @objc func didCloseButtonPress(_ sender: UIBarButtonItem!) {
        self.topViewController?.view.endEditing(true)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
