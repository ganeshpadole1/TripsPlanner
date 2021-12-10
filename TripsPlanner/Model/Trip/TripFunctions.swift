//
//  TripFunctions.swift
//  TripsPlanner
//
//  Created by ganesh padole on 10/12/21.
//

import Foundation

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        
    }
    
    static func readTrips() {
        if Data.tripModels.isEmpty {
            Data.tripModels.append(TripModel(title: "Trip to Bali!"))
            Data.tripModels.append(TripModel(title: "Mexico"))
            Data.tripModels.append(TripModel(title: "Russian Trip"))
        }
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(tripModel: TripModel) {
        
    }
}

