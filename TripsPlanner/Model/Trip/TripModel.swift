//
//  TripModel.swift
//  TripsPlanner
//
//  Created by ganesh padole on 10/12/21.
//

import Foundation
import UIKit

class TripModel {
    let id: UUID
    let title: String
    let image: UIImage?
    
    init(title: String, image: UIImage? = nil) {
        id = UUID()
        self.title = title
        self.image = image
    }
}
