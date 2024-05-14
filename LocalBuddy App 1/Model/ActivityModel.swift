import Foundation
import CloudKit

//let container = CKContainer.default()

//let privateDatabase = container.privateCloudDatabase

let recordType = "activity"

struct activity: Identifiable {
    let id: CKRecord.ID?
    let activityID: CKRecord.ID?
    let categoryID: CKRecord.Reference?
    let hostUserID: CKRecord.Reference?
    let accountTypesID: CKRecord.Reference?
    let activityName: String
    let activityDisc: String
    let activityImage: CKAsset?
    let capacity: Int64
    let date: Date
    let timeStart: Date
    let timeEnd: Date
    let note : String
//    let latitude: Double
//    let longitude: Double
    let location : String
    let numPeoplejoin: Int64

    
    init(record: CKRecord) {
            self.id = record.recordID
            self.activityID = record.recordID
            self.categoryID = record["categoryID"] as? CKRecord.Reference ?? CKRecord.Reference(recordID: CKRecord.ID(recordName: ""), action: .none)
            self.hostUserID = record["hostUserID"] as? CKRecord.Reference ?? CKRecord.Reference(recordID: CKRecord.ID(recordName: ""), action: .none)
            self.activityName = record["activityName"] as? String ?? "N/A"
            self.activityDisc = record["activityDisc"] as? String ?? "N/A"
        self.accountTypesID = record["accountTypeID"] as? CKRecord.Reference ?? CKRecord.Reference(recordID: CKRecord.ID(recordName: ""), action: .none)
        if let asset = record["activityImage"] as? CKAsset,
                   let url = asset.fileURL {
                    self.activityImage = CKAsset(fileURL: url)
                } else {
                    self.activityImage = nil
                }
            
            self.capacity = record["capacity"] as? Int64 ?? 18
            self.date = record["Date"] as? Date ?? Date()
            self.timeStart = record["timeStart"] as? Date ?? Date()
            self.timeEnd = record["timeEnd"] as? Date ?? Date()
            self.note = record["note"] as? String ?? "N/A"
            self.location = record["location"] as? String ?? "N/A"
        
            self.numPeoplejoin = record["numPeoplejoin"] as? Int64 ?? 0
        }
    }

struct ActivityTypes: Identifiable {
    let id: CKRecord.ID?
    let name: String
    
    init(record :CKRecord) {
        self.id = record.recordID
        self.name = record["name"]as? String ?? "N/A"
    }
    
}
