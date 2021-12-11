//
//  FloatingActionButton.swift
//  TripsPlanner
//
//  Created by ganesh padole on 11/12/21.
//

import UIKit

class FloatingActionButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = Theme.tintColor?.cgColor
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}
