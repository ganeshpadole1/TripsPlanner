//
//  TripModel.swift
//  TripsPlanner
//
//  Created by ganesh padole on 10/12/21.
//

import Foundation
import UIKit

struct TripModel {
    let id: UUID
    var title: String
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil) {
        id = UUID()
        self.title = title
        self.image = image
    }
}
