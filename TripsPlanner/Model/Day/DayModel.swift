//
//  DayModel.swift
//  TripsPlanner
//
//  Created by Ganesh Padole on 08/01/22.
//

import UIKit

struct DayModel {
    var id: String
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: String, subtitle: String, activityModels: [ActivityModel]? = nil) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let activityModels = activityModels {
            self.activityModels = activityModels
        }
    }
}
