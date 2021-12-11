//
//  UIViewExtensions.swift
//  TripsPlanner
//
//  Created by ganesh padole on 11/12/21.
//

import UIKit

extension UIView {
    
    func addShadowAndRoundedCorners() {
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
}
