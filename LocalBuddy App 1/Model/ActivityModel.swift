//
//  ActivityModel.swift
//  LocalBuddy App 1
//
//  Created by razan on 30/04/2024.
//

import CloudKit

class Activity {
    var activityId: Int
    var activityName: String

    init(activityId: Int, activityName: String) {
        self.activityId = activityId
        self.activityName = activityName
    }
}
