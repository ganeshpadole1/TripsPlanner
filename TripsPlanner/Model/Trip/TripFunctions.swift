//
//  TripFunctions.swift
//  TripsPlanner
//
//  Created by ganesh padole on 10/12/21.
//

import Foundation

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.isEmpty {
                Data.tripModels.append(TripModel(title: "Trip to Bali!"))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Russian Trip"))
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(tripModel: TripModel) {
        
    }
}

