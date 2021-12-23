//
//  UILabelExtensions.swift
//  TripsPlanner
//
//  Created by ganesh padole on 23/12/21.
//

import UIKit

extension UILabel {
    func applyShadow() {
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }
}
