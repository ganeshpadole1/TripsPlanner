//
//  ActivityModel.swift
//  TripsPlanner
//
//  Created by Ganesh Padole on 08/01/22.
//

import UIKit

struct ActivityModel {
    var id: String
    var title = ""
    var subtitle = ""
    var activityType: ActivityType?
    var photo: UIImage?
    
    init(title: String, subtitle: String, activityType: ActivityType? = nil, photo: UIImage? = nil) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let activityType = activityType {
            self.activityType = activityType
        }
    }
}
