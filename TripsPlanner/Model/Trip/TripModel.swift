//
//  TripModel.swift
//  TripsPlanner
//
//  Created by ganesh padole on 10/12/21.
//

import Foundation

class TripModel {
    let id: UUID
    let title: String
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}
