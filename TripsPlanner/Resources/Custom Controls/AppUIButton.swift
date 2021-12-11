//
//  AppUIButton.swift
//  TripsPlanner
//
//  Created by ganesh padole on 11/12/21.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(.white, for: .normal)
    }

}
