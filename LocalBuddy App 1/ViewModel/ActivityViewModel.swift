//
//  viewModel.swift
//  macro
//
//  Created by Ghadah Albassam on 29/04/2024.
//

import Foundation
import CloudKit
import Combine


class ActivityViewModel: ObservableObject {
    
    let publicDatabase = CKContainer(identifier: "iCloud.Apple-Acadmy.LocalBuddy-App-1").publicCloudDatabase
    
    @Published var activityTypes: [ActivityTypes] = []
    @Published var activities: [activity] = []
    @Published var activityName: [String] = []
    
    func fetchActivities() {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "activity", predicate: predicate)
        let operation = CKQueryOperation (query: query)
        
        operation.recordMatchedBlock = {recordId , result in DispatchQueue.main.sync {
            
            switch result{
            case.success(let record):
                let activity = activity(record: record)
                self.activities.append(activity)
                
            case.failure( let error) :
                print ("\(error.localizedDescription)")
                
            }
        }
        }
        
        CKContainer(identifier: "iCloud.Apple-Acadmy.LocalBuddy-App-1").publicCloudDatabase.add(operation)
    }
    func fetchActivityTypes() {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "ActivityTypes", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let activityType = ActivityTypes(record: record)
                self.activityTypes.append(activityType)
            }
        }
        
        operation.queryCompletionBlock = { _, error in
            if let error = error {
                print("Failed to fetch activity types: \(error.localizedDescription)")
            } else {
                print("Activity types fetched successfully")
            }
        }
        
        CKContainer(identifier: "iCloud.Apple-Acadmy.LocalBuddy-App-1").publicCloudDatabase.add(operation)
        
        
    }
    func saveActivity(activity: activity, completion: @escaping (Result<Void, Error>) -> Void) {
        let record = CKRecord(recordType: "activity")
        
        record["activityName"] = activity.activityName
        record["date"] = activity.date
        record["timeStart"] = activity.timeStart
        record["timeEnd"] = activity.timeEnd
        record["numPeoplejoin"] = activity.numPeoplejoin
        record["location"] = activity.location
        
        //  Assuming your CloudKit container is already set up as publicDatabase
        
        CKContainer(identifier: "iCloud.Apple-Acadmy.LocalBuddy-App-1").publicCloudDatabase.save(record) { savedRecord, error in
            if let error = error {
                print("Error saving activity:", error)
                completion(.failure(error))
            } else {
                print("Activity saved successfully")
                completion(.success(()))
            }
        }
    }
    
    
    
    //    func fetchActivities(completion: @escaping (Result<Void, Error>) -> Void) {
    //        let predicate = NSPredicate(value: true)
    //        let query = CKQuery(recordType: "activity", predicate: predicate)
    //        let operation = CKQueryOperation(query: query)
    //
    //        operation.recordFetchedBlock = { record in
    //            DispatchQueue.main.async {
    //                let newActivity = activity(record: record) // Assuming Activity is your model struct
    //                self.activities.append(newActivity)
    //            }
    //        }
    //
    //        operation.queryCompletionBlock = { _, error in
    //            if let error = error {
    //                print("Failed to fetch activities:", error.localizedDescription)
    //                completion(.failure(error))
    //            } else {
    //                print("Activities fetched successfully")
    //                completion(.success(()))
    //            }
    //        }
    //
    //        CKContainer(identifier: "iCloud.Apple-Acadmy.LocalBuddy-App-1").publicCloudDatabase.add(operation)
    //    }
    
    //    func fetchActivityNames() {
    //
    //
    //        let predicate = NSPredicate(value: true)
    //        let query = CKQuery(recordType: "activity", predicate: predicate)
    //        let operation = CKQueryOperation(query: query)
    //
    //        operation.recordFetchedBlock = { record in
    //            DispatchQueue.main.async {
    //                if let activityName = record["activityName"] as? String {
    //                   self.activityName.append(activityName) // Append activity name to activityName array
    //                }
    //            }
    //        }
    //
    //        operation.queryCompletionBlock = { _, error in
    //            if let error = error {
    //                print("Failed to fetch activity names: \(error.localizedDescription)")
    //            } else {
    //                print("Activity names fetched successfully")
    //            }
    //        }
    //
    //        publicDatabase.add(operation)
    //    }
    
    
    func addActivity( activityName:String , date :Date , timeStart:Date , timeEnd:Date ,numPeoplejoin :Int64,location:String )async throws -> CKRecord {
        
        let record = CKRecord(recordType: "activity")
        
        record["activityName"] = activityName
        record["date"] = date
        record["timeStart"] = timeStart
        record["timeEnd"]=timeEnd
        record["numPeoplejoin"] = numPeoplejoin
        record["location"] = location
        
        let savedRecord = try await CKContainer(identifier: "iCloud.Apple-Acadmy.LocalBuddy-App-1").publicCloudDatabase.save(record)
        return savedRecord
    }
    
    
    
    func saveActivity(activityName: String, date: Date, startTime: Date, endTime: Date, numPeoplejoin: Int64, location: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Task {
            do {
                let savedRecord = try await addActivity(activityName: activityName, date: date, timeStart: startTime, timeEnd: endTime, numPeoplejoin: numPeoplejoin, location: location)
                print("Activity saved:", savedRecord)
                completion(.success(()))
            } catch {
                print("Error saving activity:", error)
                completion(.failure(error))
            }
        }
    }
}
//func saveActivity(activity: activity, completion: @escaping (Result<Void, Error>) -> Void) {
    // Your implementation to save the activity to CloudKit

    
   



    
 

    
    //    func fetchActivityImages() {
    //            for activity in activities {
    //                if let imageAsset = activity.activityImage {
    //                    let fileURL = imageAsset.fileURL
    //                    // Fetch image data from fileURL and handle it accordingly
    //                    // You can use URLSession or other methods to fetch image data asynchronously
    //                    // Once you have the image data, you can update your activity model or store it as needed
    //                }
    //            }
    //        }
    //
    //}

