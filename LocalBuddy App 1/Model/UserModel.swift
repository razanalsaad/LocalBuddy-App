//
//  UserModel.swift
//  LocalBuddy App 1
//
//  Created by razan on 30/04/2024.
//
import SwiftUI
import CloudKit

struct LBUsers: Identifiable {
   let recordId: CKRecord.ID?
   var category: CKRecord.Reference
   var firstName: String
   var lastName: String
   var email: String
   var password: String
   var languageSpoken: String
   var aboutMe: String
   var rating: Double
   var isLocal: Bool
   var id = CKRecord.ID(recordName:"")
   
   
   
   init(record: CKRecord) {
      self.recordId = record.recordID
      self.category = record["category"] as? CKRecord.Reference ?? CKRecord.Reference(recordID: CKRecord.ID(recordName: "category"), action: .none)
      self.firstName = record["firstName"] as? String ?? "N/A"
      self.lastName = record["lastName"] as? String ?? "N/A"
      self.email = record["email"] as? String ?? "N/A"
      self.password = record["password"] as? String ?? "N/A"
      self.languageSpoken = record["languageSpoken"] as? String ?? "N/A"
      self.aboutMe = record["aboutMe"] as? String ?? "N/A"
      self.rating = record["rating"] as? Double ?? 0
      self.isLocal = true
   }
}
let record = CKRecord(recordType: "LBUsers")
let user = LBUsers(record: record)

